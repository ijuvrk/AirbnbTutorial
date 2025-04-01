//
//  BookingHelpers.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 02/04/25.
//

import Foundation

struct BookingHelpers {
    static func calculateTotalPrice (for listing: Listing, from: Date, to: Date) -> Int {
        let numberOfDays = from.daysBetween(to: to)
        return listing.pricePerNight * numberOfDays
    }
}
