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
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 2.0) {
                    ForEach(recipesController.recipes) { item in
                        NavigationLink(
                            destination: RecipeDetailView(recipe: item)) {
                                RecipeView(recipe: item)
                                    .accessibility(hint: Text("Opens recipe details"))
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
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
