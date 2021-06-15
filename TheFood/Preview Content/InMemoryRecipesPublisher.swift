//
//  InMemoryRecipesProvider.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Combine
import Foundation

struct InMemoryRecipesPublisher: RecipesPublisher {

    func getLatestRecipes(currentPage: Int) -> AnyPublisher<[Recipe], Never> {

        Just(Recipe.recipes).eraseToAnyPublisher()
    }
}
