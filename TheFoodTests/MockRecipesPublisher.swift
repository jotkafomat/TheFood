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

    func getLatestRecipes() -> AnyPublisher<[Recipe], Never> {
        switch self {
        case .success:
            return Just([
            Recipe(headline: "Thomasina Miers’ recipe for courgetti carbonara", thumbnail: "carbonara"),
            Recipe(headline: "Rachel Roddy’s recipe for lamb and peas", thumbnail: "lambAndPeas"),
            Recipe(headline: "Birthday custard sponge by Nigella Lawson", thumbnail: "custardSponge"),
            Recipe(headline: "Stout and chocolate cake with toasted oats by Claire Thomson", thumbnail: "stoutCake"),
            Recipe(headline: "Simple banana cake by Ravneet Gill", thumbnail: "bananaCake")])
                .eraseToAnyPublisher()
        case .failure:
            return Just<[Recipe]>([]).eraseToAnyPublisher()
        case .any:
            return Empty().eraseToAnyPublisher()
        }
    }
}
