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
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    DiscoverView(
                        controller: recipesController,
                        safeArea: geometry.safeAreaInsets.top)
                        .opacity(pageRouter.selectedPage == .discovery ? 1 : 0)
                    SearchView(
                        controller: searchController,
                        safeArea: geometry.safeAreaInsets.top)
                        .opacity(pageRouter.selectedPage == .search ? 1 : 0)
                }
                HStack(spacing: 2.0) {
                    ItemTabButton(
                        selectedPage: $pageRouter.selectedPage,
                        page: .discovery,
                        safeArea: geometry.safeAreaInsets.bottom)
                    ItemTabButton(
                        selectedPage: $pageRouter.selectedPage,
                        page: .search,
                        safeArea: geometry.safeAreaInsets.bottom)
                }
                .background(Color.gray)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(pageRouter: PageRouter())
        }
    }
}
