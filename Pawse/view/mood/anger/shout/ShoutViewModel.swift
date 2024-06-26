//
//  ShoutViewModel.swift
//  Pawse
//
//  Created by hendra on 25/06/24.
//

import Foundation

class ShoutViewModel: ObservableObject {
    var profile: Profile?
    @Published public var navigateToMoodView = false
    private var profileService = ProfileService()
    private var questService = QuestService()
    
    init() {
        self.fetchProfile()
    }
    
    private func fetchProfile() {
        profileService.getProfile { result in
            switch result {
            case .success(let profile):
                DispatchQueue.main.async {
                    self.profile = profile
                }
            case .failure(let error):
                print("Fetch Profile Error \(error)")
            }
        }
    }
    
    public func completeQuest(quest: Quest) {
        var updatedQuest = quest
        updatedQuest.isCompleted = true
        questService.updateQuest(quest: updatedQuest) { result in
            switch result {
            case .success:
                if var profile = self.profile {
                    profile.coin += quest.coin
                    self.profileService.updateProfile(profile: profile) { profileResult in
                        switch profileResult {
                        case .success:
                            DispatchQueue.main.async {
                                self.profile = profile
                                self.navigateToMoodView = true
                            }
                            print("Profile successfully updated!")
                        case .failure(let error):
                            print("Error updating profile: \(error)")
                        }
                    }
                }
            case .failure(let error):
                print("Error updating quest: \(error)")
            }
        }
    }
}
