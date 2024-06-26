//
//  MoodViewModel.swift
//  Pawse
//
//  Created by hendra on 24/06/24.
//

import Foundation

class MoodViewModel: ObservableObject {
    @Published var currentStory: Story?
    @Published var quests: [Quest]?
    @Published var user: User?
    
    private var storyService = StoryService()
    private var questService = QuestService()
    private var profileService = ProfileService()
    
    init() {
        fetchProfile()
    }
    
    private func fetchProfile() {
        profileService.getProfile { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print("Fetch Profile Error \(error)")
            }
        }
    }
    
    public func getLatestEmotion() {
        storyService.getLatestTodayStory { story, error in
            if let error = error {
                print("Error fetching the latest story: \(error.localizedDescription)")
            } else if let story = story {
                self.currentStory = story
                self.questService.getCurrentQuests(storyId: story.id!) { quests, error in
                    if let error = error {
                        print("Error fetching the latest quests: \(error.localizedDescription)")
                    } else if let quests = quests {
                        self.quests = quests
                        print(quests)
                    } else {
                        print("No quests found for today.")
                    }
                }
            } else {
                print("No stories found for today.")
            }
        }
    }
}
