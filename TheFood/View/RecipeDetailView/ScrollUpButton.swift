//
//  ScrollUpButton.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 10/06/2021.
//

import Foundation
import SwiftUI

struct ScrollUpButton: View {
    let proxy: ScrollViewProxy
    var tag: Namespace.ID

    var body: some View {
        Button(
            action: {
                withAnimation { proxy.scrollTo(tag) }},
            label: {
                Image(systemName: "arrow.up.circle")
                    .font(.title)
            })
    }
}
