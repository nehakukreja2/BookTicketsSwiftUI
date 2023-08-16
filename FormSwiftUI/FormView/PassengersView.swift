//
//  PassengersView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 16/08/23.
//

import SwiftUI

struct PassengersView: View {
    
    // MARK: - PROPERTIES
    @State var adults: Int = 1
    @State var kids: Int = 0
    @State var teens: Int = 0
    
    var body: some View {
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
}

struct PassengersView_Previews: PreviewProvider {
    static var previews: some View {
        PassengersView()
    }
}
