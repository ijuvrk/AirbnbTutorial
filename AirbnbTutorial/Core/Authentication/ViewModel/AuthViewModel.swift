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
    private let currentUserKey = "currentKey"
    private let userCredentialKey = "userCredentials"
    private let registeredUsersKey = "registeredUsers"
    
    init() {
        self.isAuthenticated = UserDefaults.standard.bool(forKey: isAuthenticatedKey)
        
        if isAuthenticated,
           let userData = UserDefaults.standard.data(forKey: currentUserKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: userData) { // decoding the JSON data and map into the model
            self.currentUser = decodedUser
        }
    }
    
    func signUp(email: String, password: String, fullName: String) {
        authError = nil // resets any previous error
        
        guard isValidEmail(email) else {
            authError = "The email is invalid"
            return
        }
        
        guard isValidPassword(password) else {
            authError = "Password must be atleast 6 characters"
            return
        }
        
        guard !fullName.isEmpty else {
            authError = "Please enter your full name."
            return
        }
        
        // check if the email already exists or not
        let existingUsers = getRegisteredUsers()
        if existingUsers.contains(where: { $0.email == email }) {
            authError = "Email already exists"
            return
        }
        
        // creating new user
        let newUser = User(
            id: UUID().uuidString,
            email: email,
            fullName: fullName,
            phoneNumber: nil,
            profileImageURL: nil,
            userType: .guest,
            accountCreationDate: Date(),
            lastLoginDate: Date()
        )
        
        // save user data
        var updatedUsers = existingUsers
        updatedUsers.append(newUser)
        saveUsers(updatedUsers)
        
        // store credentials
        saveCredentials(email, password)
        
        // Log user in
        currentUser = newUser
        isAuthenticated = true
        // saveUserState function -
        saveUserState()
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    private func getRegisteredUsers() -> [User] {
        if let userData = UserDefaults.standard.data(forKey: registeredUsersKey), // use the registeredUsers key
           let users = try? JSONDecoder().decode([User].self, from: userData) {
            return users
        }
        return []
    }
    
    private func saveUsers(_ users: [User]) {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: registeredUsersKey)
        }
    }
    
    private func saveCredentials(_ email: String, _ password: String) {
        var credentials = getCredentials()
        credentials[email] = password
        
        if let encoded = try? JSONEncoder().encode(credentials) {
            UserDefaults.standard.set(encoded, forKey: userCredentialKey)
        }
    }
    
    private func getCredentials() -> [String : String] {
        if let credentialData = UserDefaults.standard.data(forKey: userCredentialKey),
           let credentials = try? JSONDecoder().decode([String : String].self, from: credentialData) {
            return credentials
        }
        return [:]
    }
    
    private func saveUserState() {
        // save the authentication state
        UserDefaults.standard.set(isAuthenticated, forKey: isAuthenticatedKey)
        
        // save the current user data
        if let user = currentUser, let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: currentUserKey)
        }
    }
    
    // login func // should change the way this func work
    // we are no longer using mock data, we accept and store the data
    
//    func logIn(email: String, password: String) {
//        authError = nil // resets error from previous attempt
//        if email == currentUser?.email,
//           password == currentUser?.password {
//            authError = nil
//            UserDefaults.standard.set(isAuthenticated, forKey: isAuthenticatedKey)
//        } else {
//            return authError = "Invalid email or password"
//        }
//        
//    }
    
    func logIn(_ email: String, _ password: String) {
        authError = nil
        
        // validating email and password
        guard isValidEmail(email) else {
            authError = "The email is invalid"
            return
        }
        
        guard isValidPassword(password) else {
            authError = "Password must be atleast 6 characters"
            return
        }
        
        let existingUsers = getRegisteredUsers()
        let userCredentials = getCredentials()
        if existingUsers.contains(where: { $0.email == email }) &&
           if userCredentials.contains(where: { $0.[email : password] }) {
            // save user state
            isAuthenticated = true
            saveUserState()
        } else {
            authError = "Entered credentials are wrong"
        }
    
    }
    
    
}
