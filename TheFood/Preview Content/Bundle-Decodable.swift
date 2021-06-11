//
//  Bundle-Decodable.swift
//  Project8
//
//  Created by Paul Hudson on 17/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()

        // Swift’s JSONDecoder type has a property called dateDecodingStrategy, which determines how it should decode dates. We can provide that with a DateFormatter instance that describes how our dates are formatted
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
