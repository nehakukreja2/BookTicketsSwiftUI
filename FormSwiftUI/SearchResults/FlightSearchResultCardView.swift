//
//  FlightSearchResultCardView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct FlightSearchResultCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Flight Number:")
            Text("Departure Date:")
            Text("Regular Fare:")
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

struct FlightSearchResultCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchResultCardView()
    }
}
