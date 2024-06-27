//
//  AuthViewModel.swift
//  Pawse
//
//  Created by hendra on 22/06/24.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var isLoggedIn = true
        
    init() {
        self.logout()
        self.checkUserLoggedIn()
    }
    
    func checkUserLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLoggedIn = user != nil
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

}
