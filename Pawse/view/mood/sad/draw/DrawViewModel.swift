//
//  DrawViewModel.swift
//  Pawse
//
//  Created by hendra on 25/06/24.
//

import Foundation

class DrawViewModel: ObservableObject {
    @Published public var navigateToMoodView = false
    private var questService = QuestService()
    public func completeQuest (quest: Quest) {
        var updatedQuest = quest
        updatedQuest.isCompleted = true
        questService.updateQuest(quest: updatedQuest) { result in
            switch result {
            case .success :
                print("Success save quest")
                self.navigateToMoodView = true
            case .failure(let error) :
                print("Update Quest Error \(error)")
            }
        }
    }
}
