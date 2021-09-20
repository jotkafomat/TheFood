//
//  GuardianAPI- RecipeFinder.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 28/06/2021.
//

import Combine
import Foundation

extension GuardianAPI: RecipeFinder {
    func searchRecipes(by term: String, currentPage: Int = 1) -> AnyPublisher<Response?, Never> {
        let formatedTerm = applyFormatting(to: term)
        var components = self.guardianAPIURLBase
        components.queryItems?.append(URLQueryItem(name: "q", value: "\(formatedTerm)"))
        components.queryItems?.append(URLQueryItem(name: "page", value: "\(currentPage)"))
        components.queryItems?.append(URLQueryItem(name: "query-fields", value: "headline,byline"))

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return session
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Response?.self, decoder: Self.decoder)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }

    private func applyFormatting(to rawTerm: String) -> String {
        rawTerm.replacingOccurrences(
            of: " ",
            with: " AND ")
    }
}
