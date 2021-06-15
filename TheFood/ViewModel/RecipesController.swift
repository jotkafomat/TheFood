//
//  RecipesController.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Combine
import Foundation

class RecipesController: ObservableObject {

    @Published private (set) var recipes = [RecipeViewModel]()
    private let recipesPublisher: RecipesPublisher

    init(recipesPublisher: RecipesPublisher = GuardianAPI()) {
        currentPage = 1
        self.recipesPublisher = recipesPublisher
        recipesPublisher
            .getLatestRecipes(currentPage: currentPage)
            .map { $0.map(RecipeViewModel.init) }
            .receive(on: RunLoop.main)
            .assign(to: &$recipes)
    }
}
