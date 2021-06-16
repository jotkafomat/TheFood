//
//  InMemoryRecipesProvider.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Combine
import Foundation

struct InMemoryRecipesPublisher: RecipesPublisher {

    func getLatestRecipes(currentPage: Int) -> AnyPublisher<GuardianAPI.Response?, Never> {

        Just(GuardianAPI.Response(results: Recipe.recipes, pageSize: 3, currentPage: 1, pages: 1)).eraseToAnyPublisher()
    }
}
