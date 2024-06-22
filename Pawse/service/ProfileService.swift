//
//  ProfileService.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore

class ProfileService {
    private var db = Firestore.firestore()
    private var tableName = "Profile"
    
    func saveProfile(profile: Profile, userId: String) throws {
        try db.collection(tableName).document(userId).setData(from: profile)
    }
    
    func getProfile(userId: String) async throws -> Profile {
        let result = try await db.collection(tableName).document(userId).getDocument(as: Profile.self)
        return result
    }
}
