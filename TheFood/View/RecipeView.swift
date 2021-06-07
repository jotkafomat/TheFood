//
//  RecipeView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 25/05/2021.
//

import Kingfisher
import SwiftUI

struct RecipeView: View {

    let recipe: Recipe
    let frameColor: Color = FrameColor.allCases.randomElement()?.color ?? .purple

    var body: some View {
        Rectangle()
            .aspectRatio(0.97, contentMode: .fit)
            .foregroundColor(frameColor)
            .overlay(
                KFImage(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .padding(4)
            )
            .overlay(
                Text(recipe.headline)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .padding(.bottom, 4),
                alignment: .bottomLeading
            )
    }
}
struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeView(
                recipe: Recipe(
                    headline: "Thomasina Miers’ recipe for courgetti carbonara",
                    thumbnail: "https://media.guim.co.uk/793f8c456f5fa74a0f8f789580fecb950a5c2cda/0_3728_5792_3475/500.jpg",
                    trailText: "Ribbons of courgette are a great way to get more veg into your diet – here, they lend both colour and texture to a dish of garlicky, cheesy pasta",
                    byline: "Thomasina Miers",
                    body: "<p>If you think it’s a good plan to squeeze more vegetables into your diet, but, like me, don’t have the bandwidth in the mornings for green juices and smoothies, then this is the perfect dish for you. It has all the comfort and joy of a classic, creamy carbonara, but with heaps of delicious, lighter-than-light, ribboned courgetti to complement the more substantial pasta and scoop up the garlicky, pancetta-flecked sauce.</p> <h2><strong>Courgetti carbonara</strong></h2> <p>If you can find both yellow and green courgettes, they’ll add a stunning, two-tone colour to an otherwise pale dish.</p> <p>Prep <strong>15 min</strong><br>Cook <strong>25 min</strong><br>Serves <strong>4</strong></p> <p><strong>4 medium courgettes<br>Salt and black pepper<br>200g spaghetti <br>3 medium eggs</strong><br><strong>Salt and black pepper<br>75g grated </strong><strong>parmesan or pecorino</strong> (or a mix), plus extra to serve<strong><br>100g smoked pancetta cubes<br>3 small garlic cloves</strong>, peeled and finely chopped<strong><br></strong><strong>1 handful </strong><strong>roughly chopped flat-leaf parsley</strong>, to serve</p> <p>Prepare the courgettes: use a julienne peeler or sharp knife to peel them into long, fine strips, stopping when you get to the seedy core– you want about 500g – then set aside; discard the cores. </p> <p>Bring a pan of salted water to a boil and cook the spaghetti according to the packet instructions. Meanwhile, beat the eggs in a bowl, season well and stir in the cheese.</p> <p>Put a large, wide frying pan over a medium heat and stir-fry the pancetta for five minutes, by which time it will have begun to release its fat. Add the garlic, cook for another few minutes, until the pancetta and garlic are golden, then remove from the heat.</p> <p>Once the spaghetti is al dente, return the pancetta to the heat and use tongs or forks to transfer the pasta to the pancetta pan, reserving the cooking water.</p> <p>Add the courgettes to the pan with a big splash of the reserved cooking water and stir well for a few minutes, so everything is coated in the garlicky oil. Remove from the heat and stir in the egg mix until you have a lovely, glossy sauce, adding enough cooking water, a few tablespoons at a time, to get it to a creamy consistency.</p> <p>Transfer to hot plates, sprinkle with a little extra cheese and the parsley, and serve immediately.</p> <h2>And for the rest of the week …</h2> <p>I love to put a speed peeler to a courgette, yellow or otherwise, then toss it in olive oil and lemon juice and serve as part of a salad. Freeze any leftover pancetta for another recipe another day.</p>"
                    ))
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 Pro Max")
            RecipeView(
                recipe: Recipe(
                    headline: "Thomasina Miers’ recipe for courgetti carbonara",
                    thumbnail: "https://media.guim.co.uk/793f8c456f5fa74a0f8f789580fecb950a5c2cda/0_3728_5792_3475/500.jpg",
                    trailText: "Ribbons of courgette are a great way to get more veg into your diet – here, they lend both colour and texture to a dish of garlicky, cheesy pasta",
                    byline: "Thomasina Miers",
                    body: "<p>If you think it’s a good plan to squeeze more vegetables into your diet, but, like me, don’t have the bandwidth in the mornings for green juices and smoothies, then this is the perfect dish for you. It has all the comfort and joy of a classic, creamy carbonara, but with heaps of delicious, lighter-than-light, ribboned courgetti to complement the more substantial pasta and scoop up the garlicky, pancetta-flecked sauce.</p> <h2><strong>Courgetti carbonara</strong></h2> <p>If you can find both yellow and green courgettes, they’ll add a stunning, two-tone colour to an otherwise pale dish.</p> <p>Prep <strong>15 min</strong><br>Cook <strong>25 min</strong><br>Serves <strong>4</strong></p> <p><strong>4 medium courgettes<br>Salt and black pepper<br>200g spaghetti <br>3 medium eggs</strong><br><strong>Salt and black pepper<br>75g grated </strong><strong>parmesan or pecorino</strong> (or a mix), plus extra to serve<strong><br>100g smoked pancetta cubes<br>3 small garlic cloves</strong>, peeled and finely chopped<strong><br></strong><strong>1 handful </strong><strong>roughly chopped flat-leaf parsley</strong>, to serve</p> <p>Prepare the courgettes: use a julienne peeler or sharp knife to peel them into long, fine strips, stopping when you get to the seedy core– you want about 500g – then set aside; discard the cores. </p> <p>Bring a pan of salted water to a boil and cook the spaghetti according to the packet instructions. Meanwhile, beat the eggs in a bowl, season well and stir in the cheese.</p> <p>Put a large, wide frying pan over a medium heat and stir-fry the pancetta for five minutes, by which time it will have begun to release its fat. Add the garlic, cook for another few minutes, until the pancetta and garlic are golden, then remove from the heat.</p> <p>Once the spaghetti is al dente, return the pancetta to the heat and use tongs or forks to transfer the pasta to the pancetta pan, reserving the cooking water.</p> <p>Add the courgettes to the pan with a big splash of the reserved cooking water and stir well for a few minutes, so everything is coated in the garlicky oil. Remove from the heat and stir in the egg mix until you have a lovely, glossy sauce, adding enough cooking water, a few tablespoons at a time, to get it to a creamy consistency.</p> <p>Transfer to hot plates, sprinkle with a little extra cheese and the parsley, and serve immediately.</p> <h2>And for the rest of the week …</h2> <p>I love to put a speed peeler to a courgette, yellow or otherwise, then toss it in olive oil and lemon juice and serve as part of a salad. Freeze any leftover pancetta for another recipe another day.</p>"
                    ))
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityMedium)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
