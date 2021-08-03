//
//  GuardianAPI + RecipesPublisher.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 28/06/2021.
//

import Combine
import Foundation

extension GuardianAPI: RecipesPublisher {

    var guardianAPIURLBase: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "content.guardianapis.com"
        urlComponents.path = "/search"
        urlComponents.queryItems
            = [
                URLQueryItem(name: "api-key", value: "438d1261-9311-4def-b60b-36b65295dfa0"),
                URLQueryItem(name: "page-size", value: "3"),
                URLQueryItem(name: "tag", value: "tone/recipes"),
                URLQueryItem(name: "show-fields", value: Recipe.showFields),
                URLQueryItem(name: "show-tags", value: "series")
            ]
        return urlComponents
    }

    func getLatestRecipes(currentPage: Int = 0) -> AnyPublisher<Response?, Never> {
        var components = guardianAPIURLBase
        components.queryItems?.append(URLQueryItem(name: "page", value: "\(currentPage)"))

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return session
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Response?.self, decoder: Self.decoder)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
