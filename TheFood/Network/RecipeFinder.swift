//
//  RecipeFinder.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 28/06/2021.
//

import Combine
import Foundation

protocol RecipeFinder {
    func searchRecipes(by term: String, currentPage: Int) -> AnyPublisher<GuardianAPI.Response?, Never>
}
