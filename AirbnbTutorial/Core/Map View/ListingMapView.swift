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
            
            let coordinate = CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            )
            
            _mapPosition = State(initialValue: .region(
                MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
                ))
        }
    
    var body: some View {
        
        
        Map {
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
