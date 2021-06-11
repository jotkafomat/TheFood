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

    init(recipe: Recipe) {
        self.recipe = recipe
    }
}

extension RecipeViewModel: Identifiable {

    var id: String {
        recipe.id
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        htmlToAttributedString?.string ?? ""
    }
}
