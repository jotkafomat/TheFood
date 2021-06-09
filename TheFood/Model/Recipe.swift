//
//  Recipe.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

struct Recipe {
    let id: String
    let headline: String
    let thumbnail: URL
    let trailText: String
    let byline: String
    let body: String
    let tags: [Tag]
    let frameColor = FrameColor.allCases.randomElement()!
}

extension Recipe: Decodable {

    enum CodingKeys: String, CodingKey {
        case id, fields, tags
    }
    enum FieldsKeys: String, CodingKey {
        case headline, thumbnail, trailText, byline, body
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        tags = try container.decode([Tag].self, forKey: .tags)
        let fieldsContainer = try container.nestedContainer(keyedBy: FieldsKeys.self, forKey: .fields)
        headline = try fieldsContainer.decode(String.self, forKey: .headline)
        thumbnail = try fieldsContainer.decode(URL.self, forKey: .thumbnail)
        trailText = try fieldsContainer.decode(String.self, forKey: .trailText)
        byline = try fieldsContainer.decode(String.self, forKey: .byline)
        body = try fieldsContainer.decode(String.self, forKey: .body)
    }
}

extension Recipe: Identifiable {}
