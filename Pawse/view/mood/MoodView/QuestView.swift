//
//  QuestView.swift
//  Loty
//
//  Created by Akmal Hakim on 23/06/24.
//

import SwiftUI

struct QuestView: View {
    let quests: [Quest]
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Today’s Quest")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.11))
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(quests) { quest in
                        NavigationLink(destination: destinationView(for: quest)) {
                            CardView(quest: quest)
                        }
                    }
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .frame(height: 250) // Set the fixed height for the scrollable area
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    @ViewBuilder
    private func destinationView(for quest: Quest) -> some View {
        switch quest.navigation {
        case "Draw":
            DrawLottieView(quest: quest)
        case "Shout":
            ShoutView(quest: quest)
        case "Punch":
            PunchView()
        default:
            Text("Unknown destination")
        }
    }
}

#Preview {
    QuestView(quests: [Quest.empty])
}
