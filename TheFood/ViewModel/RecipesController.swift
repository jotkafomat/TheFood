//
//  RecipesController.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

class RecipesController: ObservableObject {

    @Published private (set) var recipes = [Recipe]()
    private let recipesProvider: RecipeProvider

     init(recipesProvider: RecipeProvider) {
        self.recipesProvider = recipesProvider
    }

    func getRecipes() {
        recipesProvider
            .getLatestRecipes()
            .receive(on: RunLoop.main)
            .assign(to: &$recipes)
    }

}
