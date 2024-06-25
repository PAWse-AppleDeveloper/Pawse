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
    
    private var storyService = StoryService()
    private var questService = QuestService()
    
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
