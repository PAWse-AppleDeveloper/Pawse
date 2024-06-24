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
    case sad
    case anger
    case anxiety
}

struct Quest: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var type: QuestType
    var navigation: PawseRoute
    var exp: Int
    var duration: Int
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case name
        case type
        case navigation
        case date
        case exp
        case duration
    }
}

extension Quest {
  static var empty: Quest {
      Quest(name: "", type: .sad, navigation: .Home, exp: 5, duration: 300)
  }
    
    static func quests(for type: QuestType, userId: String, storyId: String) -> [Quest] {
      let currentDate = Date()
      
      switch type {
      case .sad:
          return [
              Quest(name: "Sharing", type: .sad, navigation: .Home, exp: 1, duration: 300),
              Quest(name: "Drawing", type: .sad, navigation: .Home, exp: 1, duration: 300),
              Quest(name: "Journaling", type: .sad, navigation: .Home, exp: 1, duration: 300)
          ]
      case .anger:
          return [
              Quest(name: "Drawing", type: .anger, navigation: .Home, exp: 1, duration: 300),
              Quest(storyId: storyId, userId: userId, name: "Shouting", type: .anger, navigation: .Home, date: currentDate, exp: 1, duration: 300),
              Quest(storyId: storyId, userId: userId, name: "Punching", type: .anger, navigation: .Home, date: currentDate, exp: 1, duration: 300)
          ]
      case .anxiety:
          return [
              Quest(storyId: storyId, userId: userId, name: "Meditation", type: .anxiety, navigation: .Home, date: currentDate, exp: 1, duration: 300, isCompleted: false),
              Quest(storyId: storyId, userId: userId, name: "Challenges", type: .anxiety, navigation: .Home, date: currentDate, exp: 1, duration: 300, isCompleted: false),
              Quest(storyId: storyId, userId: userId, name: "Journaling", type: .anxiety, navigation: .Home, date: currentDate, exp: 1, duration: 300, isCompleted: false)
          ]
      }
  }
}
