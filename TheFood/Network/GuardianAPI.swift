//
//  GuardianAPI.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 05/06/2021.
//

import Combine
import Foundation

class GuardianAPI {

    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
