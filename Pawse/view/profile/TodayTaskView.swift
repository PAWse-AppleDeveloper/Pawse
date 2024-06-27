//
//  TodayTaskView.swift
//  Task Manager
//
//  Created by Kevin Fairuz on 24/06/24.
//

import SwiftUI

struct TodayTaskView: View {
    let completedTasks: Int
    let notCompletedTasks: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack {
                Text("Today's Task")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                CircularProgressView(completedTasks: completedTasks, notCompletedTasks: notCompletedTasks)
            }
            
                VStack(alignment: .center) {
                    Text("\(completedTasks)")
                        .font(.title)
                    Text("completed")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(notCompletedTasks)")
                        .font(.title)
                    Text("not completed")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.offset(y: 20)
                
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        
    }
}

struct CircularProgressView: View {
    var completedTasks: Int
    var notCompletedTasks: Int
    
    var body: some View {
        let totalTasks = completedTasks + notCompletedTasks
        let progress = totalTasks > 0 ? Double(completedTasks) / Double(totalTasks) : 0.0
        
        ZStack {
            VStack(alignment: .leading) {
                Circle()
                    .stroke(lineWidth: 15)
                    .opacity(0.3)
                    .foregroundColor(.gray)
            }
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundColor(.orange)
                .rotationEffect(Angle(degrees: 270))
        }
        
        .padding(.horizontal, 60)
        .padding(.top)
    }
}

#Preview {
    TodayTaskView()
}
