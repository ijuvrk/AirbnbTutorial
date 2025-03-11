//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 28/02/25.
//

import SwiftUI

struct ListingItemView: View {
    
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
                        Text("Miami, Florida")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("12 mi away")
                            .foregroundStyle(.gray)
                        Text("Nov 3 - 25")
                            .foregroundStyle(.gray)
                        HStack(spacing: 4) {
                            Text("$567")
                                .fontWeight(.semibold)
                            Text("night")
                        }
                        .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    // rating
                    RatingView()
                        .foregroundStyle(.black)
                }
                .font(.footnote)
                
            }
        }
    }

    #Preview {
        ListingItemView()
    }

