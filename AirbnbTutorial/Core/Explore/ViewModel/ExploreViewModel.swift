//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//

import Foundation

class ExploreViewModel: ObservableObject { // observableOjbect - swiftUI can detect changes
    @Published var listings = [Listing]()       // @Published automatically changes the UI when changed (changes in listings etc)
    private let service: ExploreService
    
    init(service: ExploreService) {         // dependency injection     // can name anything instead of "service"
        self.service = service
        
        Task { await fetchListings() }      // to immediately load the listing. since fetchListings() is an async func it used await to fetch.
    }
    
    func fetchListings() async {
        do {
            let fetchedListings = try await service.fetchListings()
            
            await MainActor.run {
                self.listings = fetchedListings
            }
        } catch {
         print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}

// Task will trigger the function call, and it will populate the listings above and it's published then because a change is made. view will be refreshed and exploreview will change.
