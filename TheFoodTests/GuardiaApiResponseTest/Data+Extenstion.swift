//
//  Data+Extenstion.swift
//  MovieAPIUITests
//
//  Created by Krzysztof Jankowski on 24/02/2021.
//

import Foundation

private class Token {}

extension Data {

    init(from filename: String, extension type: String = "json") throws {
        let bundle = Bundle(for: Token.self)
        guard let url = bundle.url(forResource: filename, withExtension: type) else {
            throw NSError(domain: "tests", code: 1, userInfo: [:]) }
        self = try Data(contentsOf: url)
    }
}
