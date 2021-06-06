//
//  RecipesController.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

class RecipesController: ObservableObject {

    @Published private (set) var recipes = [Recipe]()
    private let recipesPublisher: RecipesPublisher

    init(recipesPublisher: RecipesPublisher = GuardianAPI()) {
        self.recipesPublisher = recipesPublisher
    }

    func getRecipes() {
        recipesPublisher
            .getLatestRecipes()
            .receive(on: RunLoop.main)
            .assign(to: &$recipes)
    }
}
