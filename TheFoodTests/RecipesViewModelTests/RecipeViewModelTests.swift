//
//  RecipeViewModelTests.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 11/06/2021.
//

import SwiftUI
@testable import TheFood
import XCTest

class RecipeViewModelTests: XCTestCase {
    private var recipeViewModel: RecipeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        recipeViewModel = RecipeViewModel(recipe: Recipe.recipes[0])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        recipeViewModel = nil
    }

    func testImage() throws {
        XCTAssertEqual(recipeViewModel.image, URL(string: "https://media.guim.co.uk/793f8c456f5fa74a0f8f789580fecb950a5c2cda/0_3728_5792_3475/500.jpg"))
    }

    func testTag() throws {
        XCTAssertEqual(recipeViewModel.tag, "The simple fix")
    }

    func testNoTag() throws {
        recipeViewModel = RecipeViewModel(recipe: Recipe.recipes[1])

        XCTAssertEqual(recipeViewModel.tag, "Rachel Roddy")
    }

    func testFirstPublicationDate() throws {
        XCTAssertEqual(recipeViewModel.firstPublicationDate, "16:16 Thursday, 10 June 2021")
    }

    func testWhenThereIsNoPublicationDateItShowsNil() {
        // arrange
        let recipe = Recipe(
            id: "Pasta",
            firstPublicationDate: nil,
            headline: "Pasta",
            thumbnail: nil,
            trailText: "Pasta",
            byline: "Pachel",
            body: "Body",
            tags: [Tag(series: "Tag")])

        let recipeViewModel = RecipeViewModel(recipe: recipe)

        // act
        let result = recipeViewModel.firstPublicationDate

        // assert
        XCTAssertNil(result)
    }

    func testHeadline() throws {
        XCTAssertEqual(recipeViewModel.headline, "Thomasina Miers’ recipe for courgetti carbonara")
    }

    func testTrailtext() throws {
        XCTAssertEqual(recipeViewModel.trailText, "Ribbons of courgette are a great way to get more veg into your diet – here, they lend both colour and texture to a dish of garlicky, cheesy pasta")
    }

    func testByline() throws {
        XCTAssertEqual(recipeViewModel.byline, "Thomasina Miers")
    }

    func testId() throws {
        XCTAssertEqual(recipeViewModel.id, "food/2021/may/24/thomasina-miers-recipe-courgetti-carbonara")
    }
}
