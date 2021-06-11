//
//  RecipeDetailView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 06/06/2021.
//
import Kingfisher
import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeViewModel

    @Namespace var topID

    var body: some View {

        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    KFImage(recipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .id(topID)
                        .accessibility(label: Text(recipe.headline))
                    RecipeHeader(recipe: recipe)
                        .padding(.horizontal, 6)
                    Dividers()
                    AuthorBadgeView(recipe: recipe)
                        .padding(.horizontal, 6)
                        .padding(.bottom, 3)
                    RecipeBody(recipe: recipe)
                        .padding(.horizontal, 6)
                    Dividers()
                }
                ScrollUpButton(proxy: proxy, tag: topID)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
// }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeViewModel.all[0])
    }
}
