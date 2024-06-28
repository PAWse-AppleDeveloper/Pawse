//
//  ProfileService.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class ProfileService {
    private var db = Firestore.firestore()
    private var tableName = "users"
    
    func saveProfile(profile: User, userId: String) throws {
        try db.collection(tableName).document(userId).setData(from: profile)
    }
    
    @AppStorage("uid") private var userID: String = ""
        
    func getProfile(completion: @escaping (Result<User, Error>) -> Void) {
        guard !userID.isEmpty else {
            let noUIDError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User ID is missing"])
            completion(.failure(noUIDError))
            return
        }
        
        db.collection(tableName).document(userID).getDocument { document, error in
            if let error = error {
                print("Error fetching profile: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let document = document, document.exists else {
                let noDocumentsError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No profile found"])
                completion(.failure(noDocumentsError))
                return
            }

            do {
                let user = try document.data(as: User.self)
                completion(.success(user))
            } catch {
                print("Error decoding profile: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
        
        func updateProfile(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
            do {
                try db.collection(tableName).document(user.uid).setData(from: user, merge: true) { error in
                    if let error = error {
                        print("Error updating profile: \(error.localizedDescription)")
                        completion(.failure(error))
                    } else {
                        print("Profile successfully updated!")
                        completion(.success(()))
                    }
                }
            } catch {
                print("Error serializing profile: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
}
