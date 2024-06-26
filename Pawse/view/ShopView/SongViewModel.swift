//
//  SongViewModel.swift
//  Pawse
//
//  Created by Akmal Hakim on 26/06/24.
//

import Foundation
import SwiftUI
import AVFoundation

class SongViewModel: ObservableObject {
    @Published var songs: [Song]
    private var audioPlayer: AVAudioPlayer?
    @Published var currentlyPlayingSong: Song?
    @Published var isPlaying = false
    
    init() {
        self.songs = [
            Song(name: "Weightless", description: "if you need to calm down your anxiety", coin: 5, isBought: false, fileName: "Weightless.mp3"),
            Song(name: "Serene Solitude", description: "Evoke a sense of tranquility", coin: 3, isBought: true, fileName: "Gymnopede.mp3"),
            Song(name: "Whispers in the Glass", description: "a sense of dialogue and reflection", coin: 4, isBought: false, fileName: "Spiegel.mp3")
        ]
    }
    
    func buySong(_ song: Song) {
        if let index = songs.firstIndex(where: { $0.id == song.id }) {
            songs[index].isBought = true
        }
    }
    
    func playPreview(song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: nil) else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                self.audioPlayer?.stop()
                self.audioPlayer = nil
            }
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func playSong(_ song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: nil) else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            currentlyPlayingSong = song
            isPlaying = true
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func stopSong() {
        audioPlayer?.stop()
        audioPlayer = nil
        currentlyPlayingSong = nil
        isPlaying = false
    }
}
