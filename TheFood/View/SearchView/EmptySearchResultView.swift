//
//  EmptySearchResultView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 01/07/2021.
//

import SwiftUI

struct EmptySearchResultView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFill()
                .frame(
                    width: 50,
                    height: 50)
            Text("Search for recipes, contributors, ingredients, section or topics")
                .font(.system(.body, design: .serif))
                .fontWeight(.light)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 40)
        .foregroundColor(.secondary)
    }
}

struct EmptySearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchResultView()
    }
}
