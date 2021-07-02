//
//  ItemTapButton.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 02/07/2021.
//

import Foundation
import SwiftUI

struct ItemTabButton: View {

    @Binding var selectedPage: Page

    let page: Page

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Rectangle()
                .frame(height: 5)
                .foregroundColor(selectedPage == page ? page.color : .clear)
            Text(page.title)
                .font(.system(.headline, design: .serif))
                .fontWeight(.semibold)
                .foregroundColor(page.color)
                .padding(.bottom, 16)
                .padding(.leading, 4)
        }
        .background(Color.guardianBlueBrandMain)
        .onTapGesture {
            withAnimation {
                selectedPage = page
            }
        }
    }
}
