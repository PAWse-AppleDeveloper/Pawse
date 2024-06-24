//
//  UserQuest.swift
//  Pawse
//
//  Created by hendra on 24/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserQuest: String, Codable {
    @DocumentID var id: String?
    var questId: String
    var userId: String
    var storyId: String
    var progress: Int = 0
    
}
