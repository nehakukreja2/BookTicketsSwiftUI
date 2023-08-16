//
//  CustomDropDownMenu.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct CustomDropDownMenu: View {
    
    // MARK: - PROPERTIES
    @State var stations: [String] = []
    @State var isSelecting = false
    @State var selectionTitle = ""
    @State var isFirstSection: Bool = false
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        HStack {
            Text(selectionTitle)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: AppImages.dropDownBtn.rawValue)
                .foregroundColor(Color.black)
                .font(.system(size: 16, weight: .regular))
                .rotationEffect(.degrees( isSelecting ? -180 : 0))
        } // : HSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isSelecting.toggle()
                }
            }
            .onAppear {
                selectionTitle = isFirstSection ? StringConstants.chooseOriginStation.rawValue : StringConstants.chooseDestStation.rawValue
            }
        if isSelecting {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<stations.count) { i in
                        DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: i+1, title: stations[i], onSelect: {}))
                    }
                }
            } // : SCROLL VIEW
            .frame(height: 150)
        }
    }
}

struct CustomDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropDownMenu()
    }
}
