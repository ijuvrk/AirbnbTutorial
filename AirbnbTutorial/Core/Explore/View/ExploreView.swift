//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 27/02/25.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false //gives control to create custom animations, precise control over view switching
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())    // connects UI with data // initiates
    
    
    @State private var selectedFromDate = Date()
    @State private var selectedToDate = Date()
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView,
                                      fromDate: $selectedFromDate,
                                      toDate: $selectedToDate)
                .environmentObject(viewModel)
                //$ creates a binding with state. "show" is binding variable.
                //binding is required
            }
            else {
                ScrollView {
                    SearchAndFilterBar()
                        .environmentObject(viewModel)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                        if !viewModel.searchLocation.isEmpty && viewModel.filteredListings.isEmpty {
                                VStack(spacing: 8) {
                                    Spacer().frame(height: 200)
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .symbolEffect(.wiggle.byLayer, options: .nonRepeating)
                                        
                                        Text("No Listings Found!")
                                            .font(.headline)
                                    }
                                    
                                    Text("Try Searching for a different location")
                                        .font(.caption)
//                                    Spacer()
                                }
                        } else {
                            LazyVStack(spacing: 32) {
                                ForEach(viewModel.filteredListings) { listing in
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
