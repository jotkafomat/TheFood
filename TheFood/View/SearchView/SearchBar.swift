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
            HStack(spacing: 0.0) {
            Image(systemName: "magnifyingglass")
                .scaledToFill()
            TextField(
                "Enter Search Term",
                text: $searchTerm)
                .font(.system(.body, design: .serif))
                .autocapitalization(.none)
                .multilineTextAlignment(.leading)
            }
            .padding(4)
            .background(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous)
                    .fill(Color(.tertiarySystemBackground)))
            Spacer(minLength: 15)
        }.padding(.vertical, 4)
    }
}
