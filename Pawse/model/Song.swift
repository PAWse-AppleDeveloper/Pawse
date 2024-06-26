//
//  Song.swift
//  Pawse
//
//  Created by Akmal Hakim on 26/06/24.
//

import Foundation
import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let coin: Int
    var isBought: Bool
    let fileName: String
}
