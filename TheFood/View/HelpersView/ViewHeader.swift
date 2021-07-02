//
//  ViewHeader.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 30/06/2021.
//

import SwiftUI

struct ViewHeader: View {

    let text: String
    let safeArea: CGFloat

    var body: some View {
        HStack {
            Text(text)
                .font(.system(.largeTitle, design: .serif))
                .fontWeight(.bold)
                .padding(.leading)
            Spacer()
        }
        .padding(.top, safeArea)
        .padding(.bottom, 10)
    }
}

struct ViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ViewHeader(text: "Search", safeArea: 0)
            .previewLayout(.sizeThatFits)
    }
}
