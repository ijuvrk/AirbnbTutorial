//
//  RatingView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 03/03/25.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text("4.86")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView()
}
