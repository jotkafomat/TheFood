//
//  Tag.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 09/06/2021.
//

import Foundation

struct Tag {
    let series: String
}

extension Tag: Decodable {

    enum CodingKeys: String, CodingKey {
        case series = "webTitle"
    }
}
