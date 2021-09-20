//
//  FrameColor.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation
import SwiftUI

enum FrameColor: CaseIterable {
    case frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8

    var color: Color {
        switch self {
        case .frame1:
            return Color.guardianOrangeOpinionMain
        case .frame2:
            return Color.guardianOrangeOpinionDark
        case .frame3:
            return Color.guardianOrangeOpinionBright
        case .frame4:
            return Color.guardianOrangeOpinionPastel
        case .frame5:
            return Color.guardianBrownCultureMain
        case .frame6:
            return Color.guardianBrownCultureDark
        case .frame7:
            return Color.guardianBrownCultureBright
        case .frame8:
            return Color.guardianBrownCulturePastel
        }
    }
}
