//
//  Profile.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Profile: Codable, Identifiable {
    @DocumentID var id: String?
    var userId: String
    var username: String
    var coin: Int
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case userId = "user_id"
        case username
        case coin
    }
}

extension Profile {
  static var empty: Profile {
      Profile(userId: "", username: "", coin: 0)
  }
}
