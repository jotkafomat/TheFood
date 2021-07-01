//
//  ViewHeader.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 30/06/2021.
//

import SwiftUI

struct ViewHeader: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(.title, design: .serif))
                .fontWeight(.bold)
                .padding(.leading)
            Spacer()
        }
        .frame(height: 70)
    }
}

struct ViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ViewHeader(text: "Search")
            .previewLayout(.sizeThatFits)
    }
}
