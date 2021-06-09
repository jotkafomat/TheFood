//
//  RecipeDetailView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 06/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeViewModel

    var body: some View {

        ScrollView {
            HStack {
                Text(recipe.displayBody)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
// }

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeViewModel.all[0])
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        htmlToAttributedString?.string ?? ""
    }
}
