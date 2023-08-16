//
//  FlightSearchModel.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import Foundation

struct Flight: Identifiable, Decodable {
    var id = UUID()
    var date: Date
    var flightNumber: String
    var regularFare: Double
}

class FlightSearch: ObservableObject {
    
    @Published var origin = ""
    @Published var destination = ""
    @Published var departureDate = Date()
    @Published var adults = 1
    @Published var teen = 0
    @Published var children = 0
    @Published var flights: [Flight] = []
    
    func searchFlights() {
        // Simulate server call and response
        let mockFlights: [Flight] = [
            Flight(date: Date(), flightNumber: "FL123", regularFare: 150.0),
            Flight(date: Date(), flightNumber: "FL456", regularFare: 180.0),
            // ... add more flights
        ]
        flights = mockFlights
    }
}
