//
//  RecipeHeader.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 10/06/2021.
//

import Foundation
import SwiftUI

struct RecipeHeader: View {
    let recipe: RecipeViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.tag)
                .font(.system(.subheadline, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.pink)
            Text(recipe.headline)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .padding(.bottom, 10.0)
            Text(recipe.trailText)
                .font(.system(.body, design: .serif))
                .fontWeight(.ultraLight)
        }
    }
}
