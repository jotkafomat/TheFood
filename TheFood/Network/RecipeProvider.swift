//
//  RecipeProvider.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Foundation
import Combine

protocol RecipeProvider {
    func getLatestRecipes() -> AnyPublisher<[Recipe], Never>

}
