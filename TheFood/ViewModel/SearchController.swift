//
//  SearchController.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 28/06/2021.
//

import Combine
import Foundation

class SearchController: ObservableObject {
    @Published private (set) var recipes = [RecipeViewModel]()
    private let recipeFinder: RecipeFinder
    private var cancellable = Set<AnyCancellable>()
    private var currentPage: Int = 0
    private(set) var canLoadMorePages = true
    @Published var searchTerm = ""

    init(recipeFinder: RecipeFinder = GuardianAPI()) {
        self.recipeFinder = recipeFinder
        $searchTerm
            .dropFirst()
            .debounce(
                for: 1.25,
                scheduler: RunLoop.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: {[weak self] _ in
                self?.currentPage = 0
            })
            .filter { !$0.isEmpty }
            .handleEvents(receiveOutput: {[weak self] _ in
                self?.recipes = [RecipeViewModel]()
            })
            .sink { [weak self] searchTerm in
                self?.canLoadMorePages = true
                self?.loadMoreRecipes(by: searchTerm)
            }
            .store(in: &cancellable)
    }

    func loadMoreRecipes(by term: String? = nil) {
        guard canLoadMorePages else {
            print("cannot load more pages")
            return
        }

        currentPage += 1
        print("loading page \(currentPage)")
        recipeFinder
            .searchRecipes(by: term ?? searchTerm, currentPage: currentPage)
            .print("load recipes")
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { [weak self] response in
                let recipes = response.results.map(RecipeViewModel.init)
                self?.recipes.append(contentsOf: recipes)
                self?.canLoadMorePages = response.pages > response.currentPage
            }
            .store(in: &cancellable)
    }
}
