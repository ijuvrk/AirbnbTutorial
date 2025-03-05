//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 04/03/25.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
} //don't make multiple @State (beginner mistake)

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
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
                if selectedOption == .location {
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
                    
                    .cardShadowStyle()
                }
                else {
                    CollapsablePickerView(title: "Where to?", description: "Add destination")
                }
                
            }
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                selectedOption = .location
            }
            
            // date selection view
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    VStack(alignment: .leading) {
                        Text("When are you coming?")
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
                    .frame(height: selectedOption == .dates ? 120 : 64)
                    .cardShadowStyle()
                    
                } else {
                    CollapsablePickerView(title: "When", description: "Add dates")
                }
            }
            .onTapGesture {
                selectedOption = .dates
            } //outside VStack is better for performance
            //no creating/destroying each time
            
            // guest num view
            VStack {
                if selectedOption == .guests {
                    VStack(alignment: .leading) {
                        Text("Who are you coming with?")
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
                    .cardShadowStyle()
                    
                } else {
                    CollapsablePickerView(title: "Who", description: "Add guests")
                }
            }
            .onTapGesture {
                selectedOption = .guests
            }
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
        .cardShadowStyle()
//        .frame(height: 64)
    }
}

struct CardShadowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func cardShadowStyle() -> some View {
        modifier(CardShadowStyle())
    }
}
