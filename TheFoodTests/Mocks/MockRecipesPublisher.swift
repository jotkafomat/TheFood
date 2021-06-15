//
//  MockRecipesPublisher.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Combine
import Foundation
@testable import TheFood

enum MockRecipesPublisher: RecipesPublisher {

    case success
    case failure
    case any

    func getLatestRecipes(currentPage: Int = 1) -> AnyPublisher<[Recipe], Never> {
        switch self {
        case .success:
            return Just(Recipe.recipes)
            .eraseToAnyPublisher()
        case .failure:
            return Just<[Recipe]>([]).eraseToAnyPublisher()
        case .any:
            return Empty().eraseToAnyPublisher()
        }
    }
}
