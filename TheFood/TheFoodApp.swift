//
//  TheFoodApp.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

@main
struct TheFoodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(recipesController: RecipesController())
        }
    }
}
