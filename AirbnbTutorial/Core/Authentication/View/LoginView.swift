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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                Button() {
                    dismiss()
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
                
                //custom textfield for id and password
                ConnectedTextField(fields: [FieldData(
                    label: "Username", placeholder: "username", text: $username),
                FieldData(label: "Password", placeholder: "password", text: $password, isSecure: true)])
                
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
                
                //navigate to signup view
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.gray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Signup")
                            .foregroundStyle(.black)
                            .underline()
                    }
                }
                .padding(.top, 20)
                
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

#Preview {
    LoginView()
}
