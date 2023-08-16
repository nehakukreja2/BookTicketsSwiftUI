//
//  SearchResultsView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct SearchResultsView: View {
    
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
                            Image(systemName: "chevron.left")
                                .padding(.leading, 20)
                                .foregroundColor(.black)
                        })
                        Text("Search Results")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(0)
                    }
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<6) { _ in
                            FlightSearchResultCardView()
                                .padding(.horizontal, 20)
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
