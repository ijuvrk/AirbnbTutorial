//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 04/03/25.
//

import SwiftUI

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    
    var body: some View {
        VStack {
            
            Button {
                withAnimation(.snappy) {
                    show.toggle() // toggles state value and returns to ExploreView.
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading) {
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search destinations", text: $destination)
                        .font(.subheadline)//binds to the state. and stores in the state variable. state changed -> view refreshes, text is shown
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .shadow(radius: 10)
            .padding()
            
            
            // date selection view
            CollapsablePickerView(title: "When", description: "Add dates")
            
            // guest num view
            CollapsablePickerView(title: "Who", description: "Add guests")
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false)) //just for preview, dummy binding since there is no parentview while on preview mode
}

struct CollapsablePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(radius: 10)
        .padding()
    }
}
