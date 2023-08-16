//
//  FlightSearchResultCardView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct FlightSearchResultCardView: View {
    var body: some View {
        HStack {
            Image(systemName: StringConstants.airplaneImg.rawValue)
                .resizable()
                .frame(width: 50, height: 50, alignment: .trailing)
                .foregroundColor(.white)
                .rotationEffect(.degrees(-30), anchor: .center)
                .scaledToFill()
                .imageScale(.large)
            VStack(alignment: .leading) {
                Text(StringConstants.flightNo.rawValue)
                Text(StringConstants.flightdepDate.rawValue)
                Text(StringConstants.regularFare.rawValue)
            } // : VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
        } // : HSTACK
        .padding(20)
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
