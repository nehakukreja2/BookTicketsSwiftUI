//
//  StringConstants.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 16/08/23.
//

import Foundation

enum StringConstants: String {
    case chooseOriginStation = "Choose your origin station"
    case chooseDestStation = "Choose Destination Station"
    case departDate = "Select departure date"
    case adults = "Adults: "
    case teens = "Teens: "
    case children = "Children: "
    case searchFlights = "Search Flights"
    case searchResults = "Search Results"
    case airplaneImg = "airplane"
    case flightNo = "Flight Number: AI23121"
    case flightdepDate = "Departure Date: 23 December 2023"
    case regularFare = "Regular Fare: 25000"
    case backButtonImg = "chevron.left"
    case dropDownBtn = "chevron.down"
}

enum AppConstants: Int {
    case maxPassengerCount = 6
    case minAdults = 1
    case minChildren = 0
}
