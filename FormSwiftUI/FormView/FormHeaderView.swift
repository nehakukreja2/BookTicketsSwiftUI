//
//  FormHeaderView.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct FormHeaderView: View {
    
    @State var headerIcon: String
    @State var headertitle: String
    
    var body: some View {
        HStack {
            Image(systemName: headerIcon)
            Text(headertitle)
        }.padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
    }
}
