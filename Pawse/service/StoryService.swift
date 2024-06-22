//
//  StoryService.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore

class StoryService {
    private var db = Firestore.firestore()
    private var tableName = "Story"
    
    func saveStory(story: Story, userId: String) throws {
        try db.collection(tableName).document(userId).setData(from: story)
    }
}
