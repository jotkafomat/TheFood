//
//  SearchBar.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 01/07/2021.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchTerm: String

    var body: some View {
        HStack(spacing: 0.0) {
            Spacer(minLength: 15)
            Image(systemName: "magnifyingglass")
                .scaledToFill()
            TextField(
                "Enter Search Term",
                text: $searchTerm)
                .font(.system(.body, design: .serif))
                .autocapitalization(.none)
                .multilineTextAlignment(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer(minLength: 30)
        }
    }
}
