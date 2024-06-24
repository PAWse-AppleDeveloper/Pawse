//
//  HomeView.swift
//  Loty
//
//  Created by Akmal Hakim on 23/06/24.
//

import SwiftUI

struct HomeView: View {
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
