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
    var currentPage: Int

    init(recipesPublisher: RecipesPublisher = GuardianAPI()) {
        currentPage = 1
        self.recipesPublisher = recipesPublisher
        recipesPublisher
            .getLatestRecipes(currentPage: currentPage)
            .compactMap(\.?.results)
            .map { $0.map(RecipeViewModel.init) }
            .receive(on: RunLoop.main)
            .assign(to: &$recipes)
    }

    func loadMoreRecipes() {
        currentPage += 1
        recipesPublisher
            .getLatestRecipes(currentPage: currentPage)
            .compactMap(\.?.results)
            .map { $0.map(RecipeViewModel.init) }
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                self?.recipes.append(contentsOf: $0)
            }
            .store(in: &cancellable)
    }
}
