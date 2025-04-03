//
//  File.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 08/03/25.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let noOfBedrooms: Int
    let noOfBathrooms: Int
    let noOfGuests: Int
    let noOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageURL: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var noOfReviews: Int
    var features: [ListingFeatures]
    var amenities: [ListingAmenities] // each listing will have multiple listing amenities
    var type: ListingType // can have only one listing type
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckin = 0
    case superHost = 1
    
    var title: String {
        switch self {
        case .selfCheckin:
            return "Self Check-In"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subTitle: String {
        switch self {
        case .selfCheckin:
            return "Check yourself in with the keypad"
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests"
        }
    }
    
    var imageName: String {
        switch self {
        case .selfCheckin:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    var id: Int { self.rawValue } // computed property with a getter. this is shorthand.
                                    //single expressions getters can omit the return keyword
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool = 0
    case kitchen = 1
    case wifi = 2
    case laundry = 3
    case tv = 4
    case alarmSystem = 5
    case office = 6
    case balcony = 7
    
    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wi-Fi"
        case .laundry:
            return "laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "shield.pattern.checkered"
        case .office:
            return "pencil.and.ruler"
        case .balcony:
            return "building"
        }
    }
    
    var id: Int { self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment = 0
    case house = 1
    case townHouse = 2
    case villa = 3
    
    var description: String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
    
    var id: Int { self.rawValue }
    
    
}
