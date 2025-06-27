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
    @State private var confirmPassword = ""
    @State private var email = ""

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

            VStack(spacing: 15) {
                ConnectedTextField(fields: [
                    FieldData(
                        label: "First Name",
                        placeholder: "First Name",
                        text: $firstName
                    ),
                    FieldData(
                        label: "Second Name",
                        placeholder: "Second Name",
                        text: $secondName
                    ),
                ])
                
                //username
                CustomTextField(placeholder: "Username", isSecure: false, text: $username)
                
                //email
                CustomTextField(placeholder: "Email", isSecure: false, text: $email)
                
                //password and confirm password
                ConnectedTextField(fields: [
                    FieldData(label: "Password", placeholder: "Enter your password", text: $password, isSecure: true, capitalization: .never
                    ),
                    FieldData(label: "Confirm the password", placeholder: "Enter your password", text: $confirmPassword, isSecure: true, capitalization: .never)
                ])
                
            }

            PrimaryLoginButtonView(
                action: { print("button clicked") },
                buttonText: "SignUp"
            )
            .padding(.top, 24)

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUpView()
}
