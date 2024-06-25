//
//  SongCardView.swift
//  Loty
//
//  Created by Akmal Hakim on 24/06/24.
//

import SwiftUI

struct SongCardView: View {
    var body: some View {
        ZStack {
            Image(systemName: "music.note")
                .foregroundColor(Color(red: 0.97, green: 0.92, blue: 0.86))
                .font(.system(size: 72))
                .position(x:-10.2457, y:89.12981)
            Image(systemName: "music.note")
                .foregroundColor(Color(red: 0.97, green: 0.92, blue: 0.86))
                .font(.system(size: 36))
                .position(x:159, y:74.5)
            Image(systemName: "music.note")
                .foregroundColor(Color(red: 0.97, green: 0.92, blue: 0.86))
                .font(.system(size: 22))
                .position(x:222, y:23.5)
            Image(systemName: "music.note")
                .foregroundColor(Color(red: 0.97, green: 0.92, blue: 0.86))
                .font(.system(size: 48))
                .position(x:320.5, y:104.5)
            VStack(alignment: .leading, spacing: 24) {
                HStack(alignment: .center) {
                  // Space Between
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Weightless")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                          .foregroundColor(Color(red: 0.24, green: 0.26, blue: 0.31))
                        Text("if you need to calm down your anxiety")
                            .font(.caption)
                            .fontWeight(.medium)
                          .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                  Spacer()
                  // Alternative Views and Spacers
                    VStack(alignment: .center, spacing: 0) {
                        Image(systemName:"star.circle.fill")
                          .frame(width: 20.2832, height: 19.9316)
                          .foregroundColor(Color(red: 0.92, green: 0.7, blue: 0.03))
                        Text("5 points")
                            .font(.footnote)
                          .foregroundColor(Color(red: 0.92, green: 0.7, blue: 0.03))
                    }
                    .padding(0)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .top)
                Button("Buy") {
                    // action here
                }
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 0.2, green: 0.68, blue: 0.9))
                .cornerRadius(16)
                .foregroundColor(Color(red: 0.99, green: 0.96, blue: 0.92))
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .frame(width: 356, height: 138, alignment: .leading)
        .background(Color(red: 0.99, green: 0.96, blue: 0.92))
        .cornerRadius(25)
        .overlay(
          RoundedRectangle(cornerRadius: 25)
            .inset(by: 0.5)
            .stroke(Color(red: 1, green: 0.85, blue: 0.64), lineWidth: 1)
    )
    }
}

#Preview {
    SongCardView()
}
