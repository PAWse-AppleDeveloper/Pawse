//
//  HomeView.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var route: Route
    var body: some View {
        NavigationStack(path: $route.pawsePath) {
            VStack {
                Text("Home")
                Text(authViewModel.displayName)
            }
            .toolbar(content: {
                HStack{
                    Image(systemName: "cross.circle.fill")
                    Text("Logout")
                }
                .onTapGesture {
                    authViewModel.signOut()
                }
            })
//            Navigation from Home
//            .navigationDestination(for: PawseRoute.self) { route in
//                switch route {
//                case
//                }
//            }
        }
    }
}

#Preview {
    HomeView()
}
