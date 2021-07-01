//
//  SearchView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 22/06/2021.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var request = SearchController()

    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                ViewHeader(text: "Find")
                    .background(Color(.yellow))
                SearchBar(searchTerm: $request.searchTerm)
                    .background(Color(red: 233 / 250.00, green: 233 / 250.00, blue: 78 / 250.00
                    ))
                if request.recipes.isEmpty {
                    VStack {
                        Spacer()
                        EmptySearchResultView()
                    }
                }
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 2.0) {
                        ForEach(request.recipes) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: recipe)
                            ) {
                                RecipeView(recipe: recipe)
                                    .accessibility(hint: Text("Opens recipe details"))
                            }
                        }
                        if request.canLoadMorePages, !request.recipes.isEmpty {
                            ProgressView()
                                .onAppear {
                                    request.loadMoreRecipes()
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
        SearchView()
    }
}
