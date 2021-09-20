//
//  Recipe.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

struct Recipe {

    static let showFields: String = FieldsKeys.allCases.map { $0.rawValue }.joined(separator: ",")

    let id: String
    let firstPublicationDate: Date?
    let headline: String
    let thumbnail: URL?
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
    enum FieldsKeys: String, CodingKey, CaseIterable {
        case headline, thumbnail, trailText, byline, body, firstPublicationDate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        tags = try container.decode([Tag].self, forKey: .tags)
        let fieldsContainer = try container.nestedContainer(keyedBy: FieldsKeys.self, forKey: .fields)
        headline = try fieldsContainer.decode(String.self, forKey: .headline)
        thumbnail = try fieldsContainer.decodeIfPresent(URL.self, forKey: .thumbnail)
        trailText = try fieldsContainer.decode(String.self, forKey: .trailText)
        byline = try fieldsContainer.decode(String.self, forKey: .byline)
        body = try fieldsContainer.decode(String.self, forKey: .body)
        firstPublicationDate = try fieldsContainer.decodeIfPresent(Date.self, forKey: .firstPublicationDate)
    }
}

extension Recipe: Identifiable {}
