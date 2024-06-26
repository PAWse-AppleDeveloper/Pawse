//
//  User.swift
//  Task Manager
//
//  Created by Kevin Fairuz on 26/06/24.
//

import Foundation

class User: ObservableObject {
    @Published var points: Int = 0
    
    func completeQuest() {
        // Generate a random point between 3 and 5
        let earnedPoints = Int.random(in: 3...5)
        points += earnedPoints
    }
}
