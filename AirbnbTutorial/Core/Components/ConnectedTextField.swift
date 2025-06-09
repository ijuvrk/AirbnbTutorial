//
//  ConnectedTextField.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 02/05/25.
//

import SwiftUI

struct ConnectedTextField: View {
    
    let fields: [FieldData]
    var @Binding text: FieldData
//    let bindings: [Binding<String>] // just trying
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ForEach(fields) { field in
                
                Text(field.label)
                    .foregroundStyle(.secondary)
                
                if field.isSecure {
                    SecureField(field.placeholder, text: field.text)
                } else {
                    TextField(field.placeholder, text: field.text)
                        .keyboardType(field.keyboardType)
                        .textInputAutocapitalization(field.capitalization)
                        .autocorrectionDisabled(field.disableAutoCorrection)
                }
                
                if let lastField = fields.last, field != lastField {
                    Divider()
                        .frame(height: 0.5)
                        .background(Color(.gray))
                        .padding(.horizontal, -10)
                }
                
            }
        }
    }
    
    
    
//    @State private var text = ""
//    @State private var text2 = ""
//    
//    let header = ""
//    let header2 = ""
//    let placeholder = ""
//    
//    var body: some View {
//        VStack {
//            Text(header)
//                .foregroundStyle(.secondary)
//            TextField(placeholder, text: $text)
//                .keyboardType(.emailAddress)
//            
//            Divider()
//                .frame(height: 0.5)
//                .background(Color.primary.opacity(0.2))
//                .padding(.horizontal, -10)
//            
//            Text(header2)
//                .foregroundStyle(.secondary)
//            SecureField(placeholder, text: $text2)
//        }
//        .padding(10)
//        .overlay {
//            RoundedRectangle(cornerRadius: 5)
//                .stroke(Color.primary.opacity(0.5), lineWidth: 0.2)
//        }
//        .padding(10)
//    }
}

struct FieldData: Identifiable {
    let id: String = UUID().uuidString
    let label: String
    let placeholder: String
    let text: Binding<String>
    let isSecure: Bool
    let keyboardType: UIKeyboardType
    let capitalization: TextInputAutocapitalization
    let disableAutoCorrection: Bool
}



#Preview {
    ConnectedTextField(fields: [FieldData(label: "Email", placeholder: "Enter your Email", text: .constant(""), isSecure: false, keyboardType: .emailAddress, capitalization: .never, disableAutoCorrection: true)])
}
