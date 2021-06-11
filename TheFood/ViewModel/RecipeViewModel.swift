//
//  RecipeViewModel.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 09/06/2021.
//

import Foundation
import SwiftUI

struct RecipeViewModel {

    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        // formatter.
        formatter.dateFormat = "HH:mm EEEE, d MMMM y"
        return formatter
    }()

    private let recipe: Recipe

    var displayBody: String {
        recipe.body.replacingOccurrences(of: "</p>", with: "\n")
            .replacingOccurrences(of: "<br>", with: "\n")
            .replacingOccurrences(
                of: "<[^>]+>",
                with: "",
                options: .regularExpression)
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

    var trailText: String {
        recipe.trailText
    }

    var byline: String {
        recipe.byline
    }

    var firstPublicationDate: String {
        let date = recipe.firstPublicationDate
        return RecipeViewModel.formatter.string(from: date)
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
