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
    private var tableName = "story"
    
    func saveStory(story: Story, userId: String) throws {
        try db.collection(tableName).document(userId).setData(from: story)
    }
    
    func getLatestTodayStory(userId: String, completion: @escaping (Story?, Error?) -> Void) {
        let currentDate = Date()
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        db.collection(tableName)
            .whereField("user_id", isEqualTo: userId)
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    completion(nil, error)
                } else {
                    guard let documents = querySnapshot?.documents else {
                        completion(nil, nil)
                        return
                    }
                    do {
                        let story = try documents.compactMap {
                            try $0.data(as: Story.self)
                        }.first
                        completion(story, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
    }
}
