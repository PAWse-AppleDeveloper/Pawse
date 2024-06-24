//
//  ProfileService.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore

enum FetchResult {
    case success(Any)
    case notFound
    case failure(Error)
}

class ProfileService {
    private var db = Firestore.firestore()
    private var tableName = "profile"
    
    func saveProfile(profile: Profile, userId: String) throws {
        try db.collection(tableName).document(userId).setData(from: profile)
    }
    
    func getProfile(userId: String) async -> FetchResult {
        do {
            let document = try await db.collection(tableName).document(userId).getDocument()
            if document.exists{
                let result = try document.data(as: Profile.self)
                return .success(result)
            } else {
                return .notFound
            }
        } catch {
            return .failure(error)
        }
    }
}
