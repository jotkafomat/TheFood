//
//  RecipesController.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Foundation

class RecipesController: ObservableObject {

    @Published private (set) var recipes = [
        Recipe(headline: "Thomasina Miers’ recipe for courgetti carbonara",
               thumbnail: "carbonara"),
        Recipe(headline: "Rachel Roddy’s recipe for lamb and peas", thumbnail: "lambAndPeas"),
        Recipe(headline: "Birthday custard sponge by Nigella Lawson", thumbnail: "custardSponge"),
        Recipe(headline: "Stout and chocolate cake with toasted oats by Claire Thomson", thumbnail: "stoutCake"),
        Recipe(headline: "Simple banana cake by Ravneet Gill", thumbnail: "bananaCake")
    ]
}
