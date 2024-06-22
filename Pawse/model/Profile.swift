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
}

extension Profile {
  static var empty: Profile {
      Profile(userId: "", username: "", coin: 0)
  }
}
