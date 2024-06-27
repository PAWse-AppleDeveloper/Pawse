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
                    TabView {
                        Group {
                            MoodView()
                                .tabItem {
                                    Image(systemName: "face.smiling.fill")
                                    Text("Mood")
                                }

                            ShopView()
                                .tabItem {
                                    Image(systemName: "music.note.house.fill")
                                    Text("Shop")
                                }

                            ProfileView()
                                .tabItem {
                                    Image(systemName: "person.circle")
                                    Text("Profile")
                                }
                        }
                    }
                } else {
                    LoginView()
                }
            }
            .environmentObject(authViewModel)
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

#Preview {
    ContentView()
}
