//
//  ListingDetailView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 03/03/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    let checkInDate: Date
    let checkOutDate: Date
    
    @State private var mapPosition: MapCameraPosition?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        RatingView(rating: listing.rating)
                        Text(" - ")
                        Text("\(listing.noOfReviews) Reviews")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // host info view
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 200, alignment: .leading) //need two alignment.
                    //when a frame is created, it's content's alignment is reset.
                    
                    HStack(spacing: 2) {
                        Text("\(listing.noOfGuests) guests -")
                        Text("\(listing.noOfBedrooms) bedrooms -")
                        Text("\(listing.noOfBeds) beds -")
                        Text("\(listing.noOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle)
            }
            .padding()
            
            Divider()
            
            // listing features
            
            VStack(spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subTitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            
            Divider()
            
            // bedrooms view
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...listing.noOfBedrooms, id: \.self) { bedroom in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "bed.double")
                                    
                                    Spacer()
                                }
                                Text("Bedroom \(bedroom)")
                            }
                            .padding()
                            .frame(width: 152, height: 100)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .overlay { //shape in overlay, get's parent's size
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging) //will snap if halfway
            }
            .padding()
            
            Divider()
            
            // listing amenities
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)

                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // map view
            
            VStack {
                Text("Where you'll be")
                    .font(.headline)
                
                ListingMapView(latitude: listing.latitude, longitude: listing.longitude)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea() //make the image fuller on top
        .padding(.bottom, 70)
        .toolbar(.hidden, for: .tabBar)
        .overlay(alignment: .bottom) { //for bottom sticky button(content driven overlay) size themselves as the content
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading){
                        Text("$\(listing.totalPrice(from: checkInDate, to: checkOutDate))")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("\(Date.formatDate(checkInDate, checkOutDate))")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                         
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2], checkInDate: Date(), checkOutDate: Date())
        .environmentObject(ExploreViewModel(service: ExploreService()))
}
