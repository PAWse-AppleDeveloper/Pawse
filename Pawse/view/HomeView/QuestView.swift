//
//  QuestView.swift
//  Loty
//
//  Created by Akmal Hakim on 23/06/24.
//

import SwiftUI

struct QuestView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Today’s Quest")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.11))
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    CardView()
                    CardView()
                    CardView()
                    CardView()
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .frame(height: 250) // Set the fixed height for the scrollable area
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    QuestView()
}
