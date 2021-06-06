//
//  Recipe.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

struct GuardiaAPIResponse: Decodable {
    fileprivate let response: Response

    var recipes: [Recipe] {
        response.recipes
    }
}

private struct Response: Decodable {
    fileprivate let results: [Result]

    var recipes: [Recipe] {
        results.map(\.fields)
    }
}

private struct Result: Decodable {
    let fields: Recipe
}

struct Recipe: Decodable, Hashable {
    let headline: String
    let thumbnail: String
}
