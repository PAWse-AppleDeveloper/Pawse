//
//  StoryView.swift
//  Pawse
//
//  Created by hendra on 24/06/24.
//

import SwiftUI

struct StoryView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var route: Route
    @StateObject private var storyViewModel = StoryViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StoryView()
}
