//
//  RecipeBody.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 10/06/2021.
//

import Foundation
import SwiftUI

struct RecipeBody: View {
    let recipe: RecipeViewModel
    var body: some View {
        Text(recipe.displayBody)
            .font(.system(.body, design: .serif))
            .fontWeight(.light)
            .multilineTextAlignment(.leading)
    }
}
