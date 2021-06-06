//
//  ContentView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var recipesController: RecipesController

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 2.0) {
                ForEach(recipesController.recipes, id: \.self) { item in
                    RecipeView(recipe: item)
                }
            }
        }
        .onAppear {
            recipesController.getRecipes()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            recipesController: RecipesController(
                recipesPublisher: InMemoryRecipesPublisher()))
    }
}
#endif
