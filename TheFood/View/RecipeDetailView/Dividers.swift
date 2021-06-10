//
//  Dividers.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 10/06/2021.
//

import Foundation
import SwiftUI

struct Dividers: View {
    var body: some View {
        VStack(spacing: 4.0) {
            Divider()
            Divider()
            Divider()
            Divider()
        }
        .padding(.bottom, 4)
    }
}
