//
//  ContentView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var controller = RecipesController(recipesProvider: InMemoryRecipesProvider())

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 2.0) {
                ForEach(controller.recipes, id: \.self) { item in
                    RecipeView(recipe: item)
                }
            }
        }
        .onAppear {
            controller.getRecipes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
