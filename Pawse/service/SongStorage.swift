//
//  SongStorage.swift
//  Pawse
//
//  Created by hendra on 27/06/24.
//

import Foundation

class SongStorage {
    private let userDefaultsKey = "songs"
    
    func saveSongs(_ songs: [Song]) {
        if let encoded = try? JSONEncoder().encode(songs) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    func loadSongs() -> [Song] {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            if let decoded = try? JSONDecoder().decode([Song].self, from: savedData) {
                return decoded
            }
        }
        return []
    }
}
