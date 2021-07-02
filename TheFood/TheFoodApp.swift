//
//  TheFoodApp.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

@main
struct TheFoodApp: App {

    @StateObject var pageRouter = PageRouter()

    var body: some Scene {
        WindowGroup {
            MainView(pageRouter: pageRouter)
        }
    }
}
