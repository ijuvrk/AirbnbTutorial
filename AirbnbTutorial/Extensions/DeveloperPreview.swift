//
//  DeveloperPreview.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 12/03/25.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()      // static - property belongs to the class only. not the instances. // because we are using mock data we are ensuring that we only use one instance of this data. 
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "profile-1",
            noOfBedrooms: 4,
            noOfBathrooms: 2,
            noOfGuests: 4,
            noOfBeds: 4,
            pricePerNight: 120,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURL: ["listing-1", "listing-2", "listing-3", "listing-4"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            noOfReviews: 28,
            features: [.selfCheckin, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jane Doe",
            ownerImageUrl: "profile-2",
            noOfBedrooms: 2,
            noOfBathrooms: 1,
            noOfGuests: 2,
            noOfBeds: 2,
            pricePerNight: 80,
            latitude: 32.6514,
            longitude: -161.4333,
            imageURL: ["listing-5", "listing-6", "listing-7", "listing-8"],
            address: "567 Beach Rd",
            city: "Honolulu",
            state: "Hawaii",
            title: "Honolulu Beach House",
            rating: 4.7,
            noOfReviews: 35,
            features: [.selfCheckin],
            amenities: [.wifi, .tv],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Michael Johnson",
            ownerImageUrl: "profile-3",
            noOfBedrooms: 1,
            noOfBathrooms: 1,
            noOfGuests: 1,
            noOfBeds: 1,
            pricePerNight: 60,
            latitude: 25.7706,
            longitude: -80.13540,
            imageURL: ["listing-9", "listing-10", "listing-11", "listing-12"],
            address: "12345 South Beach Blvd",
            city: "Miami",
            state: "Florida",
            title: "South Beach Apartment",
            rating: 4.9,
            noOfReviews: 45,
            features: [.selfCheckin],
            amenities: [.wifi, .tv],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Alice Brown",
            ownerImageUrl: "profile-4",
            noOfBedrooms: 3,
            noOfBathrooms: 2,
            noOfGuests: 3,
            noOfBeds: 3,
            pricePerNight: 120,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURL: ["listing-2", "listing-4", "listing-1", "listing-3"],
            address: "124 Ocean Drive",
            city: "Miami",
            state: "Florida",
            title: "Ocean Drive Villa",
            rating: 4.8,
            noOfReviews: 20,
            features: [.selfCheckin],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv, .pool],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Bob Smith",
            ownerImageUrl: "profile-5",
            noOfBedrooms: 1,
            noOfBathrooms: 1,
            noOfGuests: 1,
            noOfBeds: 1,
            pricePerNight: 80,
            latitude: 25.8133,
            longitude: -80.2833,
            imageURL: ["listing-7", "listing-6", "listing-5", "listing-8"],
            address: "5000 SW 8th Street",
            city: "Miami",
            state: "Florida",
            title: "Art Deco Apartment",
            rating: 4.7,
            noOfReviews: 49,
            features: [.selfCheckin],
            amenities: [.wifi, .balcony],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sarah Johnson",
            ownerImageUrl: "profile-6",
            noOfBedrooms: 2,
            noOfBathrooms: 1,
            noOfGuests: 3,
            noOfBeds: 2,
            pricePerNight: 325,
            latitude: 40.7128,
            longitude: -74.0060,
            imageURL: ["listing-10", "listing-9", "listing-12", "listing-11"],
            address: "567 Broadway",
            city: "New York",
            state: "New York",
            title: "Cozy Manhattan Apartment",
            rating: 4.92,
            noOfReviews: 27,
            features: [.superHost],
            amenities: [.wifi, .tv, .kitchen, .office],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "profile-7",
            noOfBedrooms: 4,
            noOfBathrooms: 2,
            noOfGuests: 4,
            noOfBeds: 4,
            pricePerNight: 450,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURL: ["listing-12", "listing-10", "listing-11", "listing-9"],
            address: "124 Ocean Drive",
            city: "Miami",
            state: "Florida",
            title: "Luxury Miami Villa",
            rating: 4.86,
            noOfReviews: 17,
            features: [.selfCheckin, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv, .pool],
            type: .villa
        )
    ]
    
    // mock data for users
    
    var users: [User] = [
        .init(
            id: NSUUID().uuidString,
                    email: "user1@example.com",
                    fullName: "John Smith",
                    phoneNumber: "555-123-4567",
                    profileImageURL: "profile-1",
                    userType: .guest,
                    accountCreationDate: Date(timeIntervalSince1970: 1609459200), // Jan 1, 2021
                    lastLoginDate: Date()
        ),
        .init(
                id: NSUUID().uuidString,
                email: "host@example.com",
                fullName: "Jane Doe",
                phoneNumber: "555-987-6543",
                profileImageURL: "profile-2",
                userType: .host,
                accountCreationDate: Date(timeIntervalSince1970: 1614556800), // Mar 1, 2021
                lastLoginDate: Date()
            ),
            .init(
                id: NSUUID().uuidString,
                email: "admin@airbnb.com",
                fullName: "Admin User",
                phoneNumber: "555-111-2222",
                profileImageURL: "profile-3",
                userType: .admin,
                accountCreationDate: Date(timeIntervalSince1970: 1619827200), // May 1, 2021
                lastLoginDate: Date()
            )
    ]
}
