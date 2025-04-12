//
//  AuthViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 12/04/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var authError: String?
    
    private let isAuthenticatedKey = "isAuthenticated"
    private let userKey = "currentKey"
    
    init() {
        self.isAuthenticated = UserDefaults.standard.bool(forKey: isAuthenticatedKey)
        
        if isAuthenticated,
           let userData = UserDefaults.standard.data(forKey: userKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: userData) {
            self.currentUser = decodedUser
        }
    }
}
