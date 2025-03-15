//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService 
    
    init(service: ExploreService) {
        self.service = service
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
         print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
