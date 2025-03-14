//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//

import Foundation

class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview().listings
    }
}
