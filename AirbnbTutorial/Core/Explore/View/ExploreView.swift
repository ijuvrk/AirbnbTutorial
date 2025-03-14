//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 27/02/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false //gives control to create custom animations, precise control over view switching
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView) //$ creates a binding with state. "show" is binding variable.
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
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
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
