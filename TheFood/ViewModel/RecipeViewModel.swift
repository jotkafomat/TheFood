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
        formatter.dateFormat = "HH:mm EEEE, d MMMM y"
        return formatter
    }()

    private let recipe: Recipe

    var displayBody: String {
        recipe.body.replacingOccurrences(of: "</p>", with: "\n")
            .replacingOccurrences(of: "<br>", with: "\n")
            .replacingOccurrences(
                of: "<[^>]+>",
                with: "")
    }

    var color: Color {
        recipe.frameColor.color
    }
    var image: URL? {
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

    var firstPublicationDate: String? {
        guard let date = recipe.firstPublicationDate else {
            return nil
        }
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
