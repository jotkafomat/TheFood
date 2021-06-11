//
//  AuthorBadgeView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 11/06/2021.
//

import SwiftUI

struct AuthorBadgeView: View {
    let recipe: RecipeViewModel
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)

            VStack(alignment: .leading) {
                Text(recipe.byline)
                    .font(.system(.subheadline, design: .serif))
                    .fontWeight(.medium)
                    .foregroundColor(.pink)
                Text(recipe.firstPublicationDate)
                    .font(.system(.subheadline, design: .serif))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct AuthorBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorBadgeView(recipe: RecipeViewModel.all[0]).previewLayout(.sizeThatFits)
    }
}
