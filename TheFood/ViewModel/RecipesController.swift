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

    private var cancellable = Set<AnyCancellable>()
    private var currentPage: Int = 0
    private(set) var canLoadMorePages = true

    init(recipesPublisher: RecipesPublisher = GuardianAPI()) {
        self.recipesPublisher = recipesPublisher
        loadMoreRecipes()
    }

    func loadMoreRecipes() {
        guard canLoadMorePages else {
            return
        }
        currentPage += 1
        recipesPublisher
            .getLatestRecipes(currentPage: currentPage)
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { [weak self] response in
                let recipes = response.results.map(RecipeViewModel.init)
                self?.recipes.append(contentsOf: recipes)
                self?.canLoadMorePages = response.pages > response.currentPage
            }
            .store(in: &cancellable)
    }
}
