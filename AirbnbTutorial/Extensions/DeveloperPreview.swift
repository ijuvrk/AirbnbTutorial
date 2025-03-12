//
//  DeveloperPreview.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 12/03/25.
//

import Foundation

class DeveloperPreview {
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
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
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
            address: "567 Beach Rd",
            city: "Honolulu",
            state: "Hawaii",
            title: "Honolulu Beach House",
            rating: 4.7,
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
            address: "12345 South Beach Blvd",
            city: "Miami",
            state: "Florida",
            title: "South Beach Apartment",
            rating: 4.9,
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
            address: "124 Ocean Drive",
            city: "Miami",
            state: "Florida",
            title: "Ocean Drive Villa",
            rating: 4.8,
            features: [.selfCheckin],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv, .pool],
            type: .villa
        )
    ]
}
