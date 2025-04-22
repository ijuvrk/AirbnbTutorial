//
//  SocialLoginButton.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 22/04/25.
//

import Foundation
import SwiftUI

struct SocialLoginButton: View {
    let action: () -> Void
    let socialLogo: String
    let social: String
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                
                Image("airbnb-1")
                    .resizable()
                    .scaledToFit()
                
                Text("Continue with \(social)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: 360, height: 48)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 1)
            }
        }
    }
}

#Preview {
    SocialLoginButton(action: {
        print("Button is pressed")
    }, socialLogo: "airbnb-1", social: "airbnb")
}
