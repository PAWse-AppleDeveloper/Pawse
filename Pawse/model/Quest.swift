//
//  Quest.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum QuestType: String, Codable {
    case Sad
    case Angry
    case Anxiety
}

struct Quest: Codable, Identifiable {
    @DocumentID var id: String?
    var date: Date
    var name: String
    var description: String
    var type: QuestType
    var navigation: String
    var coin: Int
    var duration: Int
    var isCompleted: Bool
    var storyId: String
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case date
        case name
        case description
        case type
        case navigation
        case coin
        case duration
        case isCompleted = "is_completed"
        case storyId = "story_id"
    }
}

extension Quest {
  static var empty: Quest {
      Quest(date: Date(), name: "",description: "Tell Your Story", type: .Sad, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: "")
  }
    
    static func quests(for type: QuestType, storyId: String) -> [Quest] {
        let currentDate = Date()
      switch type {
      case .Sad:
          return [
            Quest(date: currentDate,name: "Share",description: "Tell Your Story", type: .Sad, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Draw",description: "Tell Your Story", type: .Sad, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Journal",description: "Tell Your Story", type: .Sad, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId)
          ]
      case .Angry:
          return [
            Quest(date: currentDate,name: "Draw",description: "Tell Your Story", type: .Angry, navigation: "Draw", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Shout",description: "Tell Your Story", type: .Angry, navigation: "Shout", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Punch",description: "Tell Your Story", type: .Angry, navigation: "Punch", coin: 3, duration: 300, isCompleted: false, storyId: storyId)
          ]
      case .Anxiety:
          return [
            Quest(date: currentDate,name: "Meditation",description: "Tell Your Story", type: .Anxiety, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Challenges",description: "Tell Your Story", type: .Anxiety, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId),
            Quest(date: currentDate,name: "Journal",description: "Tell Your Story", type: .Anxiety, navigation: "", coin: 3, duration: 300, isCompleted: false, storyId: storyId)
          ]
      }
  }
}
