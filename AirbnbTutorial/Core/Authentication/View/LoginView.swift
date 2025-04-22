//
//  LoginView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 19/04/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button() {
                    "Button is pressed"
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            
            HStack {
                Image("airbnb-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 80)
                    .background(Color.clear)
                
                Spacer()
            }
            
            Text("Welcome to Airbnb")
                .font(.title2)
                .fontWeight(.medium)
                .kerning(0.9)
            
            // email and password textfield
            
            HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Username")
                            .foregroundStyle(.gray)
                    }
                    TextField("username", text: $username)
                    
                    Divider()
                        .frame(height: 0.5)
                        .background(Color(.gray))
                        .padding(.horizontal, -10)
                        
                    Text("Password")
                        .foregroundStyle(.gray)
                    SecureField(text: $password, prompt: Text("Required").foregroundStyle(.gray)) {
                        Text("Password")
                    }
                }
                .padding(10)
            }
            .font(.footnote)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.5)
                    
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
