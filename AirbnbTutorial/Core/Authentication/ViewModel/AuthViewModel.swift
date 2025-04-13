//
//  AuthViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 12/04/25.
//

import Foundation
import Combine // will use in future

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
           let decodedUser = try? JSONDecoder().decode(User.self, from: userData) { // decoding the JSON data and map into the model
            self.currentUser = decodedUser
        }
    }
    
    // login func
    
    func logIn(email: String, password: String) {
        authError = nil // resets error from previous attempt
        if email == currentUser?.email,
           password == currentUser?.password {
            authError = nil
            UserDefaults.standard.set(isAuthenticated, forKey: isAuthenticatedKey)
        } else {
            return authError = "Invalid email or password"
        }
        
    }
}
