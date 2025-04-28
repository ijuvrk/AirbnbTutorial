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
        if isSecure {
            SecureField(placeholder, text: $text)
                .autocorrectionDisabled()
        } else {
            TextField(placeholder, text: $text)
        }
    }
}

#Preview {
    CustomTextField()
}
