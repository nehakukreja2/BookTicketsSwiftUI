//
//  DropDownItem.swift
//  FormSwiftUI
//
//  Created by Neha Kukreja on 16/08/23.
//

import Foundation

struct DropdownItem: Identifiable {
    let id: Int
    let title: String
    let onSelect: () -> Void
}
