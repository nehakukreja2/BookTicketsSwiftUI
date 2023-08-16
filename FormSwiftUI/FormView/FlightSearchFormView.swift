//
//  FlightSearchFormView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 14/08/23.
//

import SwiftUI

struct FlightSearchFormView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var moveToView: Bool = false
    @State private var datePickerId: Int = 0
    @State private var adults: Int = 1
    @State private var kids: Int = 0
    @State private var teens: Int = 0
    
    var body: some View {
        NavigationView {
            // MARK: - FORM
            Form {
                // MARK: - SECTION (Origin station)
                Section(header: FormHeaderView(headerIcon: "location.fill", headertitle: "Origin Station")) {
                    CustomDropDownMenu(selectionTitle: "Choose your origin station")
                }.listRowBackground(Color.white)
                
                // MARK: - SECTION (Destination station)
                Section(header: FormHeaderView(headerIcon: "mappin.and.ellipse", headertitle: "Destination Station")) {
                    CustomDropDownMenu(selectionTitle: "Choose Destination Station")
                }.listRowBackground(Color.white)
                
                // MARK: - SECTION (DEPARTURE DATE)
                Section(header: FormHeaderView(headerIcon: "calendar", headertitle: "Departure date")) {
                    DatePicker(selection: $selectedDate, in: Date.now..., displayedComponents: .date) {
                            Text("Select departure date")
                    }
                    .id(datePickerId)
                    .onChange(of: selectedDate, perform: { _ in
                        datePickerId += 1
                    })
                    .onTapGesture {
                        datePickerId += 1
                    }
                }
                
                // MARK: - SECTION (PASSENGERS)
                Section(header: FormHeaderView(headerIcon: "person.3.fill", headertitle: "Passengers")) {
                    VStack {
                        Stepper("Adults: \(adults)", value: $adults, in: 1...6)
                        Stepper("Teens: \(teens)", value: $teens, in: 0...6)
                        Stepper("Children: \(kids)", value: $kids, in: 0...6)
                    }
                }
                
                // MARK: - SECTION (SEARCH BUTTON)
                Section {
                    ZStack {
                        NavigationLink(destination: SearchResultsView(), isActive: $moveToView) {}
                        .opacity(0)
                        .disabled(true)
                        Button(action: {
                            moveToView = true
                        }, label: {
                            Text("Search Flights")
                                .frame(maxWidth: .infinity)
                        })
                        .frame(height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                        .bold()
                    }
                }.listRowBackground(Color.clear)
            } // MARK: - FORM
            .navigationBarTitle("Search Flights")
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchFormView()
    }
}
