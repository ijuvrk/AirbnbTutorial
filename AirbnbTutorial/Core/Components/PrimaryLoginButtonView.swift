//
//  PrimaryLoginButtonView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 07/03/25.
//

import SwiftUI

struct PrimaryLoginButtonView: View {
    let action: () -> Void
    let buttonText: String
    var width: CGFloat = 360
    
    var body: some View {
        Button {
            action()
        } label : {
            Text(buttonText)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: width, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    PrimaryLoginButtonView(action: {
        print("Button tapped")
    }, buttonText: "Log In", width: 360)
}
