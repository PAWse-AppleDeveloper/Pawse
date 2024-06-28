//
//  ProfileViewModel.swift
//  Pawse
//
//  Created by hendra on 27/06/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var currentStory: Story?
    @Published var quests: [Quest]?
    @Published var user: User?
    @Published var uncompletedQuests: Int = 0
    @Published var completedQuests: Int = 0
    
    private var storyService = StoryService()
    private var questService = QuestService()
    private var profileService = ProfileService()
    
    init() {
        self.fetchProfile()
        self.getLatestEmotion()
        print("Completed quest: \(completedQuests)")
        print("Uncompleted quest: \(uncompletedQuests)")
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
                        self.completedQuests = quests.filter { $0.isCompleted }.count
                        self.uncompletedQuests = quests.filter { !$0.isCompleted }.count
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
