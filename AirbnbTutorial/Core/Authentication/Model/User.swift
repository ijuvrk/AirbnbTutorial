//
//  User.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 11/04/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    let userName: String
    let password: String
    let email: String
    let fullName: String
    let phoneNumber: Int
    let profileImageURL: String
    let userType: UserType
    let accountCreationDate: Date?
    var lastLoginDate: Date?
}



enum UserType: Int, Codable {
    case host
    case guest
    case admin
    
    var title: String {
        switch self {
        case .host:
            return "Host"
        case .guest:
            return "Guest"
        case .admin:
            return "Admin"
        }
    }
}
