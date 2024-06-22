//
//  Story.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Story: Codable, Identifiable {
    @DocumentID var id: String?
    var date: Date = Date()
    var confidenceLevel: Int
    var emotion: String
    var story: String
    var userId: String
}

extension Story {
  static var empty: Story {
      Story(confidenceLevel: 1, emotion: "", story: "", userId: "")
  }
}
