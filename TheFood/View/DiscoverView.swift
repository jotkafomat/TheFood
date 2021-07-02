//
//  DiscoverView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct DiscoverView: View {

    @ObservedObject var controller: RecipesController

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0.0) {
                ViewHeader(text: "Discover")
                    .background(Color.guardianYellowHighlightMain)
                LazyVStack(spacing: 1.0) {
                    ForEach(controller.recipes) { item in
                        NavigationLink(
                            destination: RecipeDetailView(recipe: item)) {
                            RecipeView(recipe: item)
                                .accessibility(hint: Text("Opens recipe details"))
                        }
                    }
                    if controller.canLoadMorePages {
                        ProgressView()
                            .onAppear {
                                controller.loadMoreRecipes()
                            }
                    }
                }
                }
            .navigationBarHidden(true)
            }
            .ignoresSafeArea()
        }
    }
}

#if DEBUG
struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(
            controller: RecipesController(
                recipesPublisher: InMemoryRecipesPublisher()))
    }
}
#endif