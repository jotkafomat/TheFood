//
//  GuardianAPI.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 05/06/2021.
//

import Combine
import Foundation

class GuardianAPI: RecipesPublisher {

    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func getLatestRecipes(currentPage: Int = 1) -> AnyPublisher<[Recipe], Never> {
        let baseUrl = URL(string: "https://content.guardianapis.com/search?api-key=438d1261-9311-4def-b60b-36b65295dfa0&page-size=3&page=\(currentPage)&tag=tone/recipes&show-fields=\(Recipe.showFields)&show-tags=series")!
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        return session
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Response.self, decoder: Self.decoder)
            .map(\.results)
            .catch { _ in Just<[Recipe]>([]) }
            .eraseToAnyPublisher()
    }
}
