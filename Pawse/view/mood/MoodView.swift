//
//  HomeView.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import SwiftUI
import Speech

struct MoodView: View {
    @ObservedObject private var moodViewModel = MoodViewModel()
    
    var body: some View {
        
        VStack {
            Text("Home")
            NavigationLink(destination: JournalView()) {
                Text(moodViewModel.currentStory?.emotion ?? "nice")
            }
            
            if let quests = moodViewModel.quests {
                List(quests) { quest in
                    NavigationLink(destination: destinationView(for: quest)) {
                        Text(quest.name)
                    }
                }
            } else {
                Text("Loading quests...")
            }
        }
        .onAppear {
            moodViewModel.getLatestEmotion()
        }

//            Navigation from Home
//            .navigationDestination(for: PawseRoute.self) { route in
//                switch route {
//                case
//                }
//            }
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .authorized:
                print("Speech recognition authorized")
            case .denied:
                print("Speech recognition denied")
            case .restricted:
                print("Speech recognition restricted")
            case .notDetermined:
                print("Speech recognition not determined")
            @unknown default:
                print("Unknown status")
            }
        }
    }
    @ViewBuilder
    private func destinationView(for quest: Quest) -> some View {
        switch quest.navigation {
        case "Draw":
            DrawLottieView()
        case "Shout":
            ShoutView()
        case "Punch":
            PunchView()
        default:
            Text("Unknown destination")
        }
    }
}

#Preview {
    MoodView()
}
