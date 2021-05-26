//
//  InMemoryRecipesProvider.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Foundation
import Combine

struct InMemoryRecipesPublisher: RecipesPublisher {

    func getLatestRecipes() -> AnyPublisher<[Recipe], Never> {

         Just([
                Recipe(headline: "Thomasina Miers’ recipe for courgetti carbonara",
                      thumbnail: "carbonara"),
               Recipe(headline: "Rachel Roddy’s recipe for lamb and peas", thumbnail: "lambAndPeas"),
               Recipe(headline: "Birthday custard sponge by Nigella Lawson", thumbnail: "custardSponge"),
               Recipe(headline: "Stout and chocolate cake with toasted oats by Claire Thomson", thumbnail: "stoutCake"),
               Recipe(headline: "Simple banana cake by Ravneet Gill", thumbnail: "bananaCake")])
            .eraseToAnyPublisher()
    }

}
