//
//  Page.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 02/07/2021.
//

import Foundation
import SwiftUI

enum Page {
    case discovery
    case search

    var title: String {
        switch self {
        case .discovery:
            return "Discover"
        case .search:
            return "Search"
        }
    }

    var color: Color {
        switch self {
        case .discovery:
            return .guardianYellowAndWhite
        case .search:
            return .guardianRedAndWhite
        }
    }
}
