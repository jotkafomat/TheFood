//
//  FrameColor.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation
import SwiftUI

enum FrameColor: CaseIterable {
    case brown1, brown2, brown3, brown4, brown5, brown6, brown7

    var color: Color {
        switch self {
        case .brown1:
            return Color("choclate-3")
        case .brown2:
            return Color("choclate")
        case .brown3:
            return Color("choclate-1")
        case .brown4:
            return Color("choclate-2")
        case .brown5:
            return Color("choclate-3")
        case .brown6:
            return Color("choclate-4")
        case .brown7:
            return Color("choclate-5")
        }
    }
}
