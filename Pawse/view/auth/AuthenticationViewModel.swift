//
//  AuthViewModel.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import AuthenticationServices
import FirebaseAuth
import CryptoKit

enum AuthenticationState {
  case unauthenticated
  case authenticating
  case authenticated
}

class AuthenticationViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var displayName = ""
    @Published var user: User?
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    private var profileService:ProfileService
    
    private var currentNonce: String?
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.profileService = ProfileService()
        registerAuthStateHandler()
        verifySignInWithAppleAuthenticationState()
    }
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener({ auth, user in
                self.user = user
                self.authenticationState = user == nil ? .unauthenticated : .authenticated
                self.displayName = user?.displayName ?? user?.email ?? ""
            })
        }
    }
    
    func verifySignInWithAppleAuthenticationState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let providerData = Auth.auth().currentUser?.providerData
        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
          Task {
            do {
              let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
              switch credentialState {
              case .authorized:
                break
              case .revoked, .notFound:
                self.signOut()
              default:
                break
              }
            }
            catch {
            }
          }
        }
      }
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        if case .failure(let failure) = result {
            DispatchQueue.main.async {
                print(failure.localizedDescription)
                self.errorMessage = failure.localizedDescription
            }
        }
        else if case .success(let success) = result {
            if let appleIDCredential = success.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: a login callback received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    print("Unable to fetch identity token.")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable serialize token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                
                let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
                
                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        let username = result.user.email!.components(separatedBy: "@").first ?? ""
                        try await checkAndCreateProfile(userId: result.user.uid, username: username)
                        await updateDisplayName(for: result.user, with: appleIDCredential)
                    } catch {
                        print("Error authenticating: \(error)")
                    }
                }
            }
        }
    }
    
    private func checkAndCreateProfile(userId: String, username: String) async throws {
        let result = await profileService.getProfile(userId: userId)
        switch result {
        case .success(let profile):
            print("Profile already exists: \(profile)")
        case .notFound:
            let newProfile = Profile(userId: userId, username: username, coin: 0)
            do {
                try profileService.saveProfile(profile: newProfile, userId: userId)
            } catch {
                print("Error saving new profile: \(error.localizedDescription)")
                throw error
            }
        case .failure(let error):
            print("Error fetching profile: \(error.localizedDescription)")
            throw error
        }
    }
    
    func updateDisplayName(for user:User, with appleIDCredential: ASAuthorizationAppleIDCredential, force: Bool = false) async {
        if let currentDisplayName = Auth.auth().currentUser?.displayName, !currentDisplayName.isEmpty {
            
        } else {
            let changeRequest = user.createProfileChangeRequest()
            self.displayName = Auth.auth().currentUser?.displayName ?? ""
            do {
                try await changeRequest.commitChanges()
                self.displayName = Auth.auth().currentUser?.displayName ?? ""
            }
            catch {
                DispatchQueue.main.async {
                    print("Unable to update the user's displayname: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      var randomBytes = [UInt8](repeating: 0, count: length)
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }

      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

      let nonce = randomBytes.map { byte in
        // Pick a random character from the set, wrapping around if needed.
        charset[Int(byte) % charset.count]
      }

      return String(nonce)
    }

}

private func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}
