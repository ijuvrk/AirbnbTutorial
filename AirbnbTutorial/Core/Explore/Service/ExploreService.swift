//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//


import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
//        return DeveloperPreview().listings        // we have to initialize this everytime, resulting in new memory alloc and init everytime
                                                    // if fetchListings() called frequently, it's repeatedly creating identical objects.
        return DeveloperPreview.shared.listings          //singleton pattern. creates exactly one instance when app starts. // using because we are dealing with mock data here. 
    }
}
