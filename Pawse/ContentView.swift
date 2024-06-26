//
//  ContentView.swift
//  Pawse
//
//  Created by hendra on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        Group {
            NavigationStack {
                if authViewModel.isLoggedIn {
                    MoodView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(authViewModel)
        }
    }
}

#Preview {
    ContentView()
}
