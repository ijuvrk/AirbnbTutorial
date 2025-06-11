//
//  ConnectedTextField.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 02/05/25.
//

import SwiftUI

struct ConnectedTextField: View {
    
    let fields: [FieldData]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(fields.enumerated()), id: \.offset) { index, field in
                Text(field.label)
                    .foregroundStyle(.secondary)
                if field.isSecure {
                    SecureField(field.placeholder, text: field.text)
                } else {
                    TextField(field.placeholder, text: field.text)
                }
                
                if index != fields.count - 1 {
                    Divider()
                        .frame(height: 0.5)
                        .background(Color(.gray))
                        .padding(.horizontal, -10)
                }
            }
        }
        .padding(10)
        .font(.caption)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primary.opacity(0.5), lineWidth: 0.5)
        }
    }
}

struct FieldData {
    let label: String
    let placeholder: String
    let text: Binding<String>
    let isSecure: Bool
    let keyboardType: UIKeyboardType
    let capitalization: TextInputAutocapitalization
    let disableAutoCorrection: Bool
    
    init(label: String, placeholder: String, text: Binding<String>, isSecure: Bool = false, keyboardType: UIKeyboardType = .default, capitalization: TextInputAutocapitalization = .sentences, disableAutoCorrection: Bool = false) {
        self.label = label
        self.placeholder = placeholder
        self.text = text
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.capitalization = capitalization
        self.disableAutoCorrection = disableAutoCorrection
    }
}

#Preview {
    ConnectedTextField(fields: [
        FieldData(
            label: "Email",
            placeholder: "Enter your email",
            text: .constant(""),
            isSecure: false,
            keyboardType: .emailAddress,
            capitalization: .sentences,
            disableAutoCorrection: true
        ),
        FieldData(
            label: "Password",
            placeholder: "Enter your password",
            text: .constant(""),
            isSecure: true,
            keyboardType: .default,
            capitalization: .sentences,
            disableAutoCorrection: true
        )
    ])
}
