//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 28/02/25.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // Images
            
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                // listing details
                HStack(alignment: .top) {
                    // details
                    VStack(alignment: .leading) {
                        Text("\(listing.city), \(listing.state)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("12 mi away")
                            .foregroundStyle(.gray)
                        Text("Nov 3 - 25")
                            .foregroundStyle(.gray)
                        HStack(spacing: 4) {
                            Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            Text("night")
                        }
                        .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    // rating
                    RatingView(rating: listing.rating)
                        .foregroundStyle(.black)
                }
                .font(.footnote)
                
            }
        }
    }

    #Preview {
        ListingItemView(listing: DeveloperPreview.shared.listings[0])
    }

