//
//  FlightSearchFormView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 14/08/23.
//

import SwiftUI

struct FlightSearchFormView: View {
    
    var headers: [FormSectionHeader] = FormSectionHeader.allCases
    var viewModel = FlightSearchVM()
    @State var selectedDate: Date = Date()
    @State var moveToView: Bool = false
    @State var datePickerId: Int = 0
    
    var body: some View {
        NavigationView {
            // MARK: - FORM
            Form {
                // MARK: - SECTIONS (ORIGIN STATION, DESTINATION STATION, DEPARTURE DATE, PASSENGERS)
                ForEach(headers) { header in
                    Section(header: FormHeaderView(headerIcon: header.headerIcon, headertitle: header.headerTitle)) {
                        switch header {
                        case .originStation:
                            CustomDropDownMenu(stations: viewModel.stations, selectionTitle: header.selectionTitle, isFirstSection: true)
                        case .destinationStation:
                            CustomDropDownMenu(stations: viewModel.stations, selectionTitle: header.selectionTitle, isFirstSection: false)
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
                            PassengersView()
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

struct FlightSearchFormView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchFormView()
    }
}
