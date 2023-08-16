//
//  FlightSearchVM.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 16/08/23.
//

import Foundation

enum FormSectionHeader: Identifiable, CaseIterable {
    case originStation
    case destinationStation
    case departureDate
    case passengers
    var id: Self { self } 
    
    var headerTitle: String {
        switch self {
        case .originStation:
            return "Origin Station"
        case .destinationStation:
            return "Destination Station"
        case .departureDate:
            return "Departure date"
        case .passengers:
            return "Passengers"
        }
    }
    
    var headerIcon: String {
        switch self {
        case .originStation:
            return "location.fill"
        case .destinationStation:
            return "mappin.and.ellipse"
        case .departureDate:
            return "calendar"
        case .passengers:
            return "person.3.fill"
        }
    }
    
    var selectionTitle: String {
        switch self {
        case .originStation:
            return "Choose your origin station"
        case .destinationStation:
            return "Choose Destination Station"
        default:
            return ""
        }
    }
}

class FlightSearchVM {
    
    var flights: [Flight]?
    
    func hitAPIToSearchFlights() {
        guard let url = URL(string: "https://api.example.com/post_endpoint") else {
            return
        }
        
        let body: [String: Any] = [
            "key1": "value1",
            "key2": "value2"
            // Add more key-value pairs as needed
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseArray = try decoder.decode([Flight].self, from: data)
                    DispatchQueue.main.async {
                        self.flights = responseArray
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}



