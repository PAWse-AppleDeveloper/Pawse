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
        VStack {
            CatView()
            QuestView()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView()
}
