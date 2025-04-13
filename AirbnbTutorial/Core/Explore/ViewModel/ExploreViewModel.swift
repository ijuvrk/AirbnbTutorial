//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//

import Foundation

class ExploreViewModel: ObservableObject { // observableOjbect - swiftUI can detect changes
    @Published var listings = [Listing]()       // @Published automatically changes the UI when changed (changes in listings etc)
    
    @Published var searchLocation = "" // store the search query
    @Published var filteredListings = [Listing]()
    
    private let service: ExploreService // declare dependency
    
    init(service: ExploreService) {         // dependency injection     // can name anything instead of "service"
        self.service = service // in a class we need to initialize
        
        Task { await fetchListings() }      // to immediately load the listing. since fetchListings() is an async func it used await to fetch.
    }
    
    func fetchListings() async {
        do {
            let fetchedListings = try await service.fetchListings()
            
            await MainActor.run {
                self.listings = fetchedListings
                self.filteredListings = fetchedListings // initialize with all listings
                
                // our original listings remain unchanged as our "source of truth"
            }
        } catch {
         print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func filterListingsByLocation() {
        if searchLocation.isEmpty {
//            self.listings = listings
            filteredListings = listings
        } else {
            filteredListings = listings.filter { listing in
                listing.city.lowercased().contains(searchLocation.lowercased()) ||
                listing.state.lowercased().contains(searchLocation.lowercased())
            }
        }
    }
}

// Task will trigger the function call, and it will populate the listings above and it's published then because a change is made. view will be refreshed and exploreview will change.
