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
            return StringConstants.originStation.rawValue
        case .destinationStation:
            return StringConstants.destinationStation.rawValue
        case .departureDate:
            return StringConstants.departureDate.rawValue
        case .passengers:
            return StringConstants.passengers.rawValue
        }
    }
    
    var headerIcon: String {
        switch self {
        case .originStation:
            return AppImages.locationFill.rawValue
        case .destinationStation:
            return AppImages.mapPin.rawValue
        case .departureDate:
            return AppImages.calendarImg.rawValue
        case .passengers:
            return AppImages.passengersImg.rawValue
        }
    }
    
    var selectionTitle: String {
        switch self {
        case .originStation:
            return StringConstants.chooseOriginStation.rawValue
        case .destinationStation:
            return StringConstants.chooseDestStation.rawValue
        default:
            return ""
        }
    }
}

class FlightSearchVM {
    
    var stations: [String] = ["New Delhi", "Kanpur City", "Goa", "Jaipur", "Noida", "Meerut", "Lucknow", "Agra", "Pune"]
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



