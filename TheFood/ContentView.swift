//
//  ContentView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var recipesFetcher = RecipesController(recipesPublisher: InMemoryRecipesPublisher())

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 2.0) {
                ForEach(recipesFetcher.recipes, id: \.self) { item in
                    RecipeView(recipe: item)
                }
            }
        }
        .onAppear {
            recipesFetcher.getRecipes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
