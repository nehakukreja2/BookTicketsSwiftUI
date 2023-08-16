//
//  FlightSearchFormView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 14/08/23.
//

import SwiftUI

struct FlightSearchFormView: View {
    
    var headers: [FormSectionHeader] = FormSectionHeader.allCases
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
                ForEach(headers) { header in
                    // MARK: - SECTIONS (ORIGIN STATION, DESTINATION STATION, DEPARTURE DATE, PASSENGERS)
                    Section(header: FormHeaderView(headerIcon: header.headerIcon, headertitle: header.headerTitle)) {
                        switch header {
                        case .originStation:
                            CustomDropDownMenu(selectionTitle: header.selectionTitle, isFirstSection: true)
                        case .destinationStation:
                            CustomDropDownMenu(selectionTitle: header.selectionTitle, isFirstSection: false)
                        case .departureDate:
                            DatePicker(selection: $selectedDate, in: Date.now..., displayedComponents: .date) {
                                Text(StringConstants.departDate.rawValue)
                            }
                            .id(datePickerId)
                            .onChange(of: selectedDate, perform: { _ in
                                datePickerId += 1
                            })
                            .onTapGesture {
                                datePickerId += 1
                            }
                            .onAppear {
                                selectedDate = Date()
                            }
                        case .passengers:
                            VStack {
                                Stepper("\(StringConstants.adults.rawValue)\(adults)", value: $adults, in: AppConstants.minAdults.rawValue...AppConstants.maxPassengerCount.rawValue)
                                    .onAppear {
                                        adults = AppConstants.minAdults.rawValue
                                    }
                                Stepper("\(StringConstants.teens.rawValue)\(teens)", value: $teens, in: AppConstants.minChildren.rawValue...AppConstants.maxPassengerCount.rawValue)
                                    .onAppear {
                                        teens = AppConstants.minChildren.rawValue
                                    }
                                Stepper("\(StringConstants.children.rawValue)\(kids)", value: $kids, in: AppConstants.minChildren.rawValue...AppConstants.maxPassengerCount.rawValue)
                                    .onAppear {
                                        kids = AppConstants.minChildren.rawValue
                                    }
                            }
                        }
                    } // : SECTIONS (ORIGIN STATION, DESTINATION STATION, DEPARTURE DATE, PASSENGERS)
                    .listRowBackground(Color.white) // Apply the background color to each section
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
                            Text(StringConstants.searchFlights.rawValue)
                                .frame(maxWidth: .infinity)
                        })
                        .frame(height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                        .bold()
                    }
                }.listRowBackground(Color.clear)
            } // : FORM
            .navigationBarTitle(StringConstants.searchFlights.rawValue)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchFormView()
    }
}
