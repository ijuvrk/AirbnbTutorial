//
//  User.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 11/04/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    let email: String
    let fullName: String
    let phoneNumber: String
    let profileImageURL: String
    let userType: UserType
    let accountCreationDate: Date
    var lastLoginDate: Date?
    
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
    
    var initials:String {
        let components = fullName.components(separatedBy: " ")
        
        if components.count > 1,
           let first = components.first?.first,
           let last = components.last?.first {
            return "\(first)\(last)"
        } else if let first = components.first?.first { //chaining else and if let binding 
            return "\(first)"
        }
           return ""
    }
}






