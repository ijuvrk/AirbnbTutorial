//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 14/03/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    
    init() {
        
    }
    
    func fetchListings() async {
        
    }
}
