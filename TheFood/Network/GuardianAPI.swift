//
//  GuardianAPI.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 05/06/2021.
//

import Combine
import Foundation

class GuardianAPI: RecipesPublisher {

    private let session: URLSession
    private let baseUrl: URL

    init(
        session: URLSession = URLSession.shared,
        baseUrl: URL = URL(
            string: "https://content.guardianapis.com/search?api-key=438d1261-9311-4def-b60b-36b65295dfa0&page-size=50&tag=tone/recipes&show-fields=thumbnail,headline")!) {
        self.session = session
        self.baseUrl = baseUrl
    }

    func getLatestRecipes() -> AnyPublisher<[Recipe], Never> {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        return session
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: GuardiaAPIResponse.self, decoder: JSONDecoder())
            .map(\.recipes)
            .catch { _ in Just<[Recipe]>([]) }
            .eraseToAnyPublisher()
    }
}
