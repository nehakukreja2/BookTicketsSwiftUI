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
    case originStation = "Origin Station"
    case destinationStation = "Destination Station"
    case departureDate = "Departure date"
    case passengers = "Passengers"
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
}

enum AppImages: String {
    case backButtonImg = "chevron.left"
    case dropDownBtn = "chevron.down"
    case locationFill = "location.fill"
    case mapPin = "mappin.and.ellipse"
    case calendarImg = "calendar"
    case passengersImg = "person.3.fill"
}

enum AppConstants: Int {
    case maxPassengerCount = 6
    case minAdults = 1
    case minChildren = 0
}
