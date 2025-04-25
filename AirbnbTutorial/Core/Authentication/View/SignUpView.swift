//
//  SignUp.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 24/04/25.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Image("airbnb-1")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 80)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUpView()
}
