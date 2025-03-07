//
//  ProfileOptionRowView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 07/03/25.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}
// create separate view like this only when we gonna use it on multiple screens
#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
