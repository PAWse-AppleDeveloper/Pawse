//
//  ContentView.swift
//  Pawse
//
//  Created by hendra on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        Group {
            switch (authViewModel.authenticationState) {
            case .authenticating:
                Text("Loading...")
            case .authenticated:
                MoodView()
                    .environmentObject(authViewModel)
            case .unauthenticated:
                SignInView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
