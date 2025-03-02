//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 28/02/25.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // Images
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
                
                // listing details
                HStack(alignment: .top) {
                    // details
                    VStack(alignment: .leading) {
                        Text("Miami, Florida")
                            .fontWeight(.semibold)
                        Text("12 mi away")
                            .foregroundStyle(.gray)
                        Text("Nov 3 - 25")
                            .foregroundStyle(.gray)
                        HStack(spacing: 4) {
                            Text("$567")
                                .fontWeight(.semibold)
                            Text("night")
                        }
                    }
                    
                    Spacer()
                    // rating
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                    }
                }
                .font(.footnote)
                
            }
        }
    }

    #Preview {
        ListingItemView()
    }

