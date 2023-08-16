//
//  SearchResultsView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentation
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: AppImages.backButtonImg.rawValue)
                                .imageScale(.large)
                                .padding(.leading, 20)
                                .foregroundColor(.black)
                        }) // : BUTTON
                        Text(StringConstants.searchResults.rawValue)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(0)
                    } // : HSTACK
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<6) { _ in
                            FlightSearchResultCardView()
                                .padding(.horizontal, 10)
                        }
                    }
                    Spacer()
                } // : VSTACK
            } // : SCROLL VIEW
        }.navigationBarHidden(true)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
