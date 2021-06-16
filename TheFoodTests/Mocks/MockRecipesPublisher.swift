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

    func getLatestRecipes(currentPage: Int = 1) -> AnyPublisher<GuardianAPI.Response?, Never> {
        switch self {
        case .success:
            return Just(GuardianAPI.Response(results: Recipe.recipes, pageSize: 3, currentPage: 1, pages: 1))
            .eraseToAnyPublisher()
        case .failure:
            return Just<GuardianAPI.Response?>(nil).eraseToAnyPublisher()
        case .any:
            return Empty().eraseToAnyPublisher()
        }
    }
}
