//
//  RatingView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 03/03/25.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text(rating, format: .number.precision(.fractionLength(2)))
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView(rating: 4.576)
}
