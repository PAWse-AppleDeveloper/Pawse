//
//  AuthViewModel.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseAuth

enum AuthState {
    case Initialize
    case Login
    case Logout
}

class AuthenticationViewModel: ObservableObject {
    @Published var authState: AuthState = .Initialize
        
    init() {
        self.checkUserLoggedIn()
    }
    
    func checkUserLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.authState = user != nil ? .Login : .Logout
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            authState = .Logout
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

}
