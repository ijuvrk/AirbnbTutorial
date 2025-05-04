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
    
    let placeholder = ""
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
            
            Divider()
            
            TextField(placeholder, text: $text2)
        }
    }
}

#Preview {
    ConnectedTextField()
}
