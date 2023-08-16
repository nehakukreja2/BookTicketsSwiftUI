//
//  DropDownMenuItem.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 14/08/23.
//

import SwiftUI

struct DropdownItem: Identifiable {
    let id: Int
    let title: String
    let onSelect: () -> Void
}

struct DropDownMenuItem: View {
    @Binding var isSelecting: Bool
    @Binding var selectiontitle: String
    let item: DropdownItem
    
    var body: some View {
        Button(action: {
            isSelecting = false
            selectiontitle = item.title
            item.onSelect()
        }) {
            VStack {
                HStack {
                    Text(item.title)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(Color.black)
                        .frame(height: 30)
                    Spacer()
                }
                Divider()
            }
            .foregroundColor(.white)
        }
    }
}
