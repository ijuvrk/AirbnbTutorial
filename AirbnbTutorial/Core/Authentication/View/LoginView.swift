//
//  LoginView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 19/04/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
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
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
