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
            RecipeView(recipe: Recipe.recipes[0])
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 Pro Max")
            RecipeView(recipe: Recipe.recipes[0])
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityMedium)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
