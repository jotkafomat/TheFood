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
private let baseURL: URL

    init(session: URLSession, baseURL: URL) {
        self.session = session
        self.baseURL = baseURL
    }

    func getLatestRecipes() -> AnyPublisher<[Recipe], Never> {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        return session
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: GuardiaAPIResponse.self, decoder: JSONDecoder())
            .map(\.recipes)
            .catch { _ in Just<[Recipe]>([]) }
            .eraseToAnyPublisher()
    }
}
