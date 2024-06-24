//
//  HomeView.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import SwiftUI
import Speech

struct MoodView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
//    @EnvironmentObject var route: Route
    
    var body: some View {
        NavigationStack {
            Text("Home")
            NavigationLink(destination: JournalView().environmentObject(authViewModel)) {
                Text("HAHAHA")
            }

//            Navigation from Home
//            .navigationDestination(for: PawseRoute.self) { route in
//                switch route {
//                case
//                }
//            }
        }
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
}

#Preview {
    MoodView()
}
