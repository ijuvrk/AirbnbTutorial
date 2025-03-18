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
            self.listings = try await service.fetchListings()
        } catch {
         print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
