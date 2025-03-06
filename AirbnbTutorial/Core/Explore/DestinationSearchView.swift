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
    @State private var selectedOption: DestinationSearchOptions = .location //to re-render the view when the state changes
    @State private var fromDate = Date()
    @State private var toDate = Date()
    @State private var noOfGuests: Int = 0
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle() // toggles state value and returns to ExploreView.
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if destination != "" || noOfGuests != 0 {
                    Button("Clear") {
                        destination = ""
                        fromDate = Date()
                        toDate = Date()
                        noOfGuests = 0
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            //location view
            VStack(alignment: .leading) {
                if selectedOption == .location {
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
                } else {
                    CollapsablePickerView(title: "Where to?", description: "Add destination")
                }
            }
            .frame(height: selectedOption == .location ? 120 : 50)
            .collapsibleDestinationViewModifier()
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            // date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $fromDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $toDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsablePickerView(title: "When", description: "Add dates")
                }
            }
            .frame(height: selectedOption == .dates ? 180 : 50)
            .collapsibleDestinationViewModifier()
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates } }//outside VStack is better for performance
            //no creating/destroying each time
            
            // guest num view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                        Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(noOfGuests) Adults")
                    } onIncrement: {
                        noOfGuests += 1
                    } onDecrement: {
                        guard noOfGuests > 0 else { return }
                        noOfGuests -= 1
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsablePickerView(title: "Who", description: "Add guests")
                }
            }
            .frame(height: selectedOption == .guests ? 120 : 50)
            .collapsibleDestinationViewModifier()
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            Spacer() // to push content to the top
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
    }
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

extension View {
    func collapsibleDestinationViewModifier() -> some View {
        modifier(CollapsibleDestinationViewModifier())
    }
}
