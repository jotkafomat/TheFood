//
//  MainView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 01/07/2021.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var pageRouter: PageRouter

    @StateObject var recipesController = RecipesController()
    @StateObject var searchController = SearchController()

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ZStack {
                DiscoverView(controller: recipesController)
                    .opacity(pageRouter.selectedPage == .discovery ? 1 : 0)
                SearchView(controller: searchController)
                    .opacity(pageRouter.selectedPage == .search ? 1 : 0)
            }
            HStack(spacing: 2.0) {
                ItemTabButton(
                    selectedPage: $pageRouter.selectedPage,
                    page: .discovery)
                ItemTabButton(
                    selectedPage: $pageRouter.selectedPage,
                    page: .search)
            }
            .background(Color.gray)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(pageRouter: PageRouter())
        }
    }
}
