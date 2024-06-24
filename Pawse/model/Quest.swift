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
              Quest(name: "Shouting", type: .anger, navigation: .Home, exp: 1, duration: 300),
              Quest(name: "Punching", type: .anger, navigation: .Home, exp: 1, duration: 300)
          ]
      case .anxiety:
          return [
              Quest(name: "Meditation", type: .anxiety, navigation: .Home, exp: 1, duration: 300),
              Quest(name: "Challenges", type: .anxiety, navigation: .Home, exp: 1, duration: 300),
              Quest(name: "Journaling", type: .anxiety, navigation: .Home, exp: 1, duration: 300)
          ]
      }
  }
}
