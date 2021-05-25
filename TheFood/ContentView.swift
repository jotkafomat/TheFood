//
//  ContentView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import SwiftUI

struct ContentView: View {
    private let recipes = [
        Recipe(headline: "Thomasina Miers’ recipe for courgetti carbonara",
               thumbnail: "carbonara"),
        Recipe(headline: "Rachel Roddy’s recipe for lamb and peas", thumbnail: "lambAndPeas"),
        Recipe(headline: "Birthday custard sponge by Nigella Lawson", thumbnail: "custardSponge"),
        Recipe(headline: "Stout and chocolate cake with toasted oats by Claire Thomson", thumbnail: "stoutCake"),
        Recipe(headline: "Simple banana cake by Ravneet Gill", thumbnail: "bananaCake")
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 2.0) {
                ForEach(recipes, id: \.self) { item in
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
