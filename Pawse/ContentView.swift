//
//  ContentView.swift
//  Pawse
//
//  Created by hendra on 21/06/24.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        Group {
            NavigationStack {
                MoodView()
            }
        }
    }
}

#Preview {
    ContentView()
}
