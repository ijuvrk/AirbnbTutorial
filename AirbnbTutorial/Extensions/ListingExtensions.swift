//
//  ListingExtensions.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 02/04/25.
//

import Foundation

extension Listing {
    func totalPrice (from: Date, to: Date) -> Int {
        let numberOfDays = from.daysBetween(to: to)
        return pricePerNight * numberOfDays
    }
}
