//
//  ListingMapView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 04/04/25.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    let latitude: Double
    let longitude: Double
    
    @State private var mapPosition: MapCameraPosition
    
        init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
            
            let coordinate = CLLocationCoordinate2D( // coordinate object
                latitude: latitude,
                longitude: longitude
            )
            
            _mapPosition = State(initialValue: .region( // .reigion - method on MapCameraPosition
                MKCoordinateRegion( // defines a rectangular area on map
                    center: coordinate, // center point of visible area
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) // size of area to display. .01 - 1.11km N-S & 1.11km E-W
                )
                ))
        }
    
    var body: some View {
        
        Map(position: $mapPosition) {
            Marker("Location", coordinate: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            ))
        }
        .mapStyle(.standard) // try changing to other views
        .mapControls {
            MapCompass()
            MapScaleView()
        }
    }
}
