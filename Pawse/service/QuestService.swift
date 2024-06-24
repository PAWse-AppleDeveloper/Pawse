//
//  QuestService.swift
//  Pawse
//
//  Created by hendra on 24/06/24.
//

import Foundation
import FirebaseFirestore

class QuestService {
    private var db = Firestore.firestore()
    private var tableName = "quest"
    
    func saveQuest(quest: Quest) throws {
        try db.collection(tableName).document(quest.userId).setData(from: quest)
    }
    
    func createAutoQuests(type: QuestType, userId: String, storyId: String) throws {
        let quests = Quest.quests(for: type, userId: userId, storyId: storyId)
        for quest in quests {
            try saveQuest(quest: quest)
        }
    }
    
    func getCurrentQuests(for date: Date, userId: String, storyId: String, completion: @escaping ([Quest]?, Error?) -> Void) {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        db.collection(tableName)
            .document(userId)
            .collection("userQuests")
            .whereField("story_id", isEqualTo: storyId)
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    completion(nil, error)
                } else {
                    let quests = querySnapshot?.documents.compactMap { document in
                        try? document.data(as: Quest.self)
                    }
                    completion(quests, nil)
                }
            }
    }
}
