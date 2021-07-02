//
//  TheFoodApp.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI
import UIKit

@main
struct TheFoodApp: App {

    @StateObject var pageRouter = PageRouter()

    var body: some Scene {
        WindowGroup {
            MainView(pageRouter: pageRouter)
        }
    }

    init() {
        setUpNavigationBarAppearance()
    }

    private func setUpNavigationBarAppearance() {
        let font = UIFont(
            descriptor: .preferredFontDescriptor(withTextStyle: .headline).withDesign(.serif)!,
            size: 20)
        let controlStates = [UIControl.State.normal, .highlighted, .focused]

        controlStates.forEach {
            UIBarButtonItem.appearance().setTitleTextAttributes([.font: font], for: $0)
        }
    }
}
