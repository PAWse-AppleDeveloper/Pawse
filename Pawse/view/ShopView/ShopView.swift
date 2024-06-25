//
//  ShopView.swift
//  Loty
//
//  Created by Akmal Hakim on 24/06/24.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shop")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading) // Apply padding to align with the content below
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                    SongCardView()
                }
                .padding() // Add padding to the VStack for better spacing
            }
        }
    }
}
#Preview {
    ShopView()
}
