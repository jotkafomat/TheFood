//
//  SearchView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 22/06/2021.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var controller: SearchController
    let safeArea: CGFloat

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0.0) {
                    ViewHeader(text: "Search", safeArea: safeArea)
                        .background(Color.guardianRedNewsMain)
                    SearchBar(searchTerm: $controller.searchTerm)
                        .background(Color.guardianRedNewsDark)
                    if controller.recipes.isEmpty {
                        EmptySearchResultView()
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                    }
                    LazyVStack(spacing: 1.0) {
                        ForEach(controller.recipes) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: recipe)
                            ) {
                                RecipeView(recipe: recipe)
                                    .accessibility(hint: Text("Opens recipe details"))
                            }
                        }
                        if controller.canLoadMorePages, !controller.recipes.isEmpty {
                            ProgressView()
                                .onAppear {
                                    controller.loadMoreRecipes()
                                }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            SearchView(controller: SearchController(), safeArea: geometry.safeAreaInsets.top)
        }
        .preferredColorScheme(.dark)
    }
}
