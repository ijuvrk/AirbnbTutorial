//
//  CustomTextField.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 28/04/25.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .autocorrectionDisabled()
            } else {
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled()
            }
        }
        .padding(10)
        .font(.caption)
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

#Preview {
    CustomTextField(placeholder: "Username", isSecure: false, text: .constant(""))
}
