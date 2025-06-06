//
//  SearchAndFilterBar.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 01/03/25.
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    @EnvironmentObject var viewModel: ExploreViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.searchLocation.isEmpty ? "Where to?" : viewModel.searchLocation)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Anywhere - Any Week - Add Guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay(
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        )
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
        .environmentObject(ExploreViewModel(service: ExploreService()))
}
