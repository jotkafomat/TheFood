//
//  RecipesPublisher.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Foundation
import Combine

protocol RecipesPublisher {
    func getLatestRecipes() -> AnyPublisher<[Recipe], Never>

}
