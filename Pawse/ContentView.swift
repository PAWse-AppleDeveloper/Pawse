//
//  ContentView.swift
//  Pawse
//
//  Created by hendra on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    @State private var selectedTab: Tab = .mood
    
    enum Tab {
        case mood
        case shop
        case profile
    }
    
    var body: some View {
        Group {
            NavigationStack {
                switch authViewModel.authState {
                case .Initialize:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                case .Login:
                    TabView {
                        Group {
                            MoodView()
                                .tabItem {
                                    Image(systemName: "face.smiling.fill")
                                    Text("Mood")
                                }
                                .tag(Tab.mood)
                            
                            ShopView()
                                .tabItem {
                                    Image(systemName: "music.note.house.fill")
                                    Text("Shop")
                                }
                                .tag(Tab.shop)
                            
                            ProfileView()
                                .tabItem {
                                    Image(systemName: "person.circle")
                                    Text("Profile")
                                }
                                .tag(Tab.profile)
                        }
                    }
                case .Logout:
                    LoginView()
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                UITabBar.appearance().backgroundColor = .white
            }
        }
    }
}

#Preview {
    ContentView()
}
