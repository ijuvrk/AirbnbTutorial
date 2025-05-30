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
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(fields.enumerated()), id: \.offset) {
                
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

struct FieldData {
    let label: String
    let placeholder: String
    let text: Binding<String>
    let isSecure: Bool
    let keyboardType: UIKeyboardType
    let capitalization: TextInputAutocapitalization
    let disableAutoCorrection: Bool
}

#Preview {
    ConnectedTextField()
}
