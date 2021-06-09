//
//  RecipeViewModel.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 09/06/2021.
//

import Foundation
import SwiftUI

struct RecipeViewModel {

    private let recipe: Recipe

    var displayBody: String {
        recipe.body.htmlToString
    }

    var color: Color {
        recipe.frameColor.color
    }
    var image: URL {
        recipe.thumbnail
    }
    var tag: String {
        recipe.tags.first?.series ?? recipe.byline
    }

    var headline: String {
        recipe.headline
    }

    init(recipe: Recipe) {
        self.recipe = recipe
    }
}

extension RecipeViewModel: Identifiable {

    var id: String {
        recipe.id
    }
}
