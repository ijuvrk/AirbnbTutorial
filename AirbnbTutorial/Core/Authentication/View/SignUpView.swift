//
//  SignUp.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 24/04/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var secondName = ""
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Image("airbnb-1")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 80)
            
            Text("Sign up")
                .font(.title2)
                .fontWeight(.medium)
                .kerning(0.9)
                .padding(.bottom, 15)
            
            TextField("Username", text: $username)
            TextField("Second Name", text: $secondName)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUpView()
}
