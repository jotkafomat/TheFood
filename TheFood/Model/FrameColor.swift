//
//  FrameColor.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation
import SwiftUI

enum FrameColor: CaseIterable {
    case blue, brown, cyan, green, magenta, orange, red

    var color: Color {
        switch self {
        case .blue:
            return Color(.blue)
        case .brown:
            return Color(.brown)
        case .cyan:
            return Color(.cyan)
        case .green:
            return Color(.green)
        case .magenta:
            return Color(.magenta)
        case .orange:
            return Color(.orange)
        case .red:
            return Color(.red)
        }
    }
}
