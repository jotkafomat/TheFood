//
//  ContentView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var controller = RecipesController()

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 2.0) {
                ForEach(controller.recipes, id: \.self) { item in
                    RecipeView(recipe: item)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
