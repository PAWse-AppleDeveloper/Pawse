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
    var name: String
    var coin: Int
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case name
        case coin
    }
}

extension Profile {
  static var empty: Profile {
      Profile(name: "", coin: 0)
  }
}
