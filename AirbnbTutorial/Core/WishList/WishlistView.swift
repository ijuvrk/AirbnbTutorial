//
//  WishlistView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 07/03/25.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {

            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                .frame(width: 340, height: 100)
                
                PrimaryLoginButtonView(action: {
                    print("Button Tapped")
                }, buttonText: "Log In")
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }


#Preview {
    WishlistView()
}
