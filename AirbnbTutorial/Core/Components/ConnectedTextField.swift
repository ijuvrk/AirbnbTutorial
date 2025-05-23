//
//  ConnectedTextField.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 02/05/25.
//

import SwiftUI

struct ConnectedTextField: View {
    @State private var text = ""
    @State private var text2 = ""
    
    let header = ""
    let header2 = ""
    let placeholder = ""
    
    var body: some View {
        VStack {
            Text(header)
            TextField(placeholder, text: $text)
            
            Divider()
            
            Text(header2)
            TextField(placeholder, text: $text2)
        }
        .padding(10)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 0.2)
        }
    }
}

#Preview {
    ConnectedTextField()
}
