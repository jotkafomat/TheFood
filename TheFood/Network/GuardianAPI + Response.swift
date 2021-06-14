//
//  GuardianAPI + Response.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 09/06/2021.
//

import Foundation

extension GuardianAPI {
    struct Response {
        let results: [Recipe]
        let pageSize: Int
        let currentPage: Int
        let pages: Int
    }
}
extension GuardianAPI.Response: Decodable {

    enum CodingKeys: String, CodingKey {
        case response
    }
    enum ResponseKeys: String, CodingKey {
        case results, pageSize, currentPage, pages
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseContainer = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        results = try responseContainer.decode([Recipe].self, forKey: .results)
        pageSize = try responseContainer.decode(Int.self, forKey: .pageSize)
        currentPage = try responseContainer.decode(Int.self, forKey: .currentPage)
        pages = try responseContainer.decode(Int.self, forKey: .pages)
    }
}
