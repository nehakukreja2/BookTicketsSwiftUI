//
//  CustomDropDownMenu.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 15/08/23.
//

import SwiftUI

struct CustomDropDownMenu: View {
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100))
    ]
    @State var isSelecting = false
    @State var selectionTitle = ""
    
    var body: some View {
        HStack {
            Text(selectionTitle)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(Color.black)
                .font(.system(size: 16, weight: .regular))
                .rotationEffect(.degrees( isSelecting ? -180 : 0))
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isSelecting.toggle()
                }
            }
        if isSelecting {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 1, title: "Messages", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 2, title: "Archived", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 3, title: "Trash", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 1, title: "Messages", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 2, title: "Archived", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 3, title: "Trash", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 1, title: "Messages", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 2, title: "Archived", onSelect: {}))
                    DropDownMenuItem(isSelecting: $isSelecting, selectiontitle: $selectionTitle, item: .init(id: 3, title: "Trash", onSelect: {}))
                }
            }.frame(height: 150)
        }
    }
}

struct CustomDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropDownMenu()
    }
}
