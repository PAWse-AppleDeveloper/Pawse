//
//  TodayTask.swift
//  Task Manager
//
//  Created by Kevin Fairuz on 24/06/24.
//

import SwiftUI

struct Profile: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title2)
                    Text(user.email)
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("\(user.coin) points")
                        .font(.title3)
                        .foregroundColor(.yellow)
                        .bold()
                }
                .padding(.leading, 10)
                
            }
            .padding()
            
        }
        
    }
}
