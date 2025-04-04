//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 27/02/25.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false //gives control to create custom animations, precise control over view switching
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())    // connects UI with data
    
    @State private var selectedFromDate = Date()
    @State private var selectedToDate = Date()
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView,
                                      fromDate: $selectedFromDate,
                                      toDate: $selectedToDate) //$ creates a binding with state. "show" is binding variable.
                //binding is required
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing,
                                                checkInDate: selectedFromDate,
                                                checkOutDate: selectedToDate) 
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                        ListingDetailView(listing: listing, checkInDate: selectedFromDate,
                                          checkOutDate: selectedToDate)
                        .navigationBarBackButtonHidden()
                        .toolbar(.hidden)
                }
            }
            }
    }
}

#Preview {
    ExploreView()
}
