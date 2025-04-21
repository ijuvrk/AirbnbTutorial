//
//  LoginView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 19/04/25.
//

import SwiftUI

struct LoginView: View {
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

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
