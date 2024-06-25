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
    var type: QuestType
    var navigation: String
    var exp: Int
    var duration: Int
    var storyId: String
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case date
        case name
        case type
        case navigation
        case exp
        case duration
        case storyId = "story_id"
    }
}

extension Quest {
  static var empty: Quest {
      Quest(date: Date(), name: "", type: .Sad, navigation: "", exp: 5, duration: 300, storyId: "")
  }
    
    static func quests(for type: QuestType, storyId: String) -> [Quest] {
        let currentDate = Date()
      switch type {
      case .Sad:
          return [
            Quest(date: currentDate,name: "Sharing", type: .Sad, navigation: "", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Drawing", type: .Sad, navigation: "", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Journaling", type: .Sad, navigation: "", exp: 1, duration: 300, storyId: storyId)
          ]
      case .Angry:
          return [
            Quest(date: currentDate,name: "Drawing", type: .Angry, navigation: "Draw", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Shouting", type: .Angry, navigation: "Shout", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Punching", type: .Angry, navigation: "Punch", exp: 1, duration: 300, storyId: storyId)
          ]
      case .Anxiety:
          return [
            Quest(date: currentDate,name: "Meditation", type: .Anxiety, navigation: "", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Challenges", type: .Anxiety, navigation: "", exp: 1, duration: 300, storyId: storyId),
            Quest(date: currentDate,name: "Journaling", type: .Anxiety, navigation: "", exp: 1, duration: 300, storyId: storyId)
          ]
      }
  }
}
