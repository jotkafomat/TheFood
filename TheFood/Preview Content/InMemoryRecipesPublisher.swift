//
//  InMemoryRecipesProvider.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 26/05/2021.
//

import Combine
import Foundation

struct InMemoryRecipesPublisher: RecipesPublisher {

    func getLatestRecipes() -> AnyPublisher<[Recipe], Never> {

        Just([
            Recipe(headline: "Thomasina Miers’ recipe for courgetti carbonara", thumbnail: "https://media.guim.co.uk/793f8c456f5fa74a0f8f789580fecb950a5c2cda/0_3728_5792_3475/500.jpg"),
            Recipe(headline: "Rachel Roddy’s recipe for lamb and peas", thumbnail: "https://media.guim.co.uk/05b7db8ba4ac0656f91ed819c2abd50bb84e3204/0_1180_8031_4820/500.jpg"),
            Recipe(headline: "Birthday custard sponge by Nigella Lawson", thumbnail: "https://media.guim.co.uk/826b0c0435488cdf2268011ef92a1c234c255801/0_639_2350_1410/500.jpg"),
            Recipe(headline: "Stout and chocolate cake with toasted oats by Claire Thomson", thumbnail: "https://media.guim.co.uk/186d6572dbab2134b6cd76aca25a78a59862b62c/0_3179_4474_2684/500.jpg"),
            Recipe(headline: "Simple banana cake by Ravneet Gill", thumbnail: "https://media.guim.co.uk/8c0b7e866f0fb9120afa884c4f5b919f63fac7d0/0_2618_6732_4037/500.jpg")]).eraseToAnyPublisher()
    }
}
