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
                Button() {
                    print("Button is pressed")
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
                .padding(.bottom, 20)
            
                Image("airbnb-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 80)
                    .background(Color.clear)

            
            Text("Welcome to Airbnb")
                .font(.title2)
                .fontWeight(.medium)
                .kerning(0.9)
                .padding(.bottom, 15)
            
            // email and password textfield
            
            VStack(alignment: .leading) {
                    Text("Username/email")
                        .foregroundStyle(.gray)
                TextField("username", text: $username)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                Divider()
                    .frame(height: 0.5)
                    .background(Color(.gray))
                    .padding(.horizontal, -10)
                
                Text("Password")
                    .foregroundStyle(.gray)
                SecureField("password", text: $password)
            }
            .padding(10)
            .font(.caption)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.5)
                
            }
            
            //continue button
            PrimaryLoginButtonView(action: {print("button tapped")}, buttonText: "Continue")
                .padding(.top, 25)
            
            //separation view
            HStack(alignment: .center, spacing: 12) {
                        VStack {
                            Divider()
                        }
                        Text("or")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                        VStack {
                            Divider()
                        }
            }
            .padding(.top, 25)
            
            //socials view
            VStack(spacing: 20) {
                SocialLoginButton(action: {
                    print("Button pressed")
                }, socialLogo: "apple-1", social: "Apple")
                SocialLoginButton(action: {
                    print("Button pressed")
                }, socialLogo: "facebook-1", social: "Facebbok")
                
                SocialLoginButton(action: {
                    print("Button pressed")
                }, socialLogo: "google-1", social: "Google")
            }
            .padding(.top, 25)
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
