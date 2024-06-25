//
//  CatView.swift
//  Loty
//
//  Created by Akmal Hakim on 23/06/24.
//

import SwiftUI

struct CatView: View {
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 36) {
                HStack(alignment: .center) {
                    Image(systemName: "dollarsign.circle.fill")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.92, green: 0.76, blue: 0.32))
                    // Space Between
                    HStack(alignment: .center, spacing: 0) {
                        Text("545")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.92, green: 0.76, blue: 0.32))
                    }
                    .padding(0)
                    Spacer()
                    // Alternative Views and Spacers
                    Button("Shop") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color(red: 0.92, green: 0.76, blue: 0.32))
                    .cornerRadius(24)
                    .foregroundColor(Color(red: 0.64, green: 0.52, blue: 0.37))
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(width: 396, alignment: .center)
                .background(Color(red: 0.64, green: 0.52, blue: 0.37))
                LottieView(name: "hello_2", loopMode: .loop)
                Button(action: {
                        // Action to perform when the button is tapped
                      }) {
                        Label("Start Journaling", systemImage: "book.closed.fill")
                              .padding(.horizontal, 0)
                              .padding(.vertical, 16)
                              .frame(width: 396, alignment: .top)
                              .background(Color(red: 0.19, green: 0.69, blue: 0.78))
                              .foregroundColor(.white)
                      }
            }
            .background(Color(red: 0.92, green: 0.87, blue: 0.81))
        }
    }
}

#Preview {
    CatView()
}
