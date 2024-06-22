//
//  ContentView.swift
//  Pawse
//
//  Created by hendra on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var route: Route
    
    var body: some View {
        Group {
            switch (authViewModel.authenticationState) {
            case .authenticating:
                Text("Loading...")
            case .authenticated:
                HomeView()
                    .environmentObject(authViewModel)
                    .environmentObject(route)
            case .unauthenticated:
                SignInView()
                    .environmentObject(authViewModel)
                    .environmentObject(route)
            }
        }
    }
}

#Preview {
    ContentView()
}
