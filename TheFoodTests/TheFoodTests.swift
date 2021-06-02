//
//  TheFoodTests.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import XCTest
import Combine
@testable import TheFood

class TheFoodTests: XCTestCase {

    var recipesController: RecipesController!
    var cancellable: AnyCancellable?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        recipesController = nil
        cancellable?.cancel()
    }

    func testWhenPublisherSuccedToFetchRecipesArrayIsNotEmpty() throws {
        let expectation = expectation(description: "expect recipes to not be empty")
        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.success)

        cancellable = recipesController
            .$recipes
            .dropFirst()
            .sink { recipes in
                XCTAssertFalse(recipes.isEmpty)
                expectation.fulfill()
            }

        recipesController.getRecipes()
        waitForExpectations(timeout: 1.0)
    }

    func testWhenPublisherFailToFetchRecipesArrayIsEmpty() throws {
        let expectation = expectation(description: "expect recipes to  be empty")
        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.failure)

        cancellable = recipesController
            .$recipes
            .dropFirst()
            .sink { recipes in
                XCTAssert(recipes.isEmpty)
                expectation.fulfill()
            }

        recipesController.getRecipes()
        waitForExpectations(timeout: 1.0)
    }

    func testWhenPublisherANy() throws {
        let expectation = expectation(description: "expect recipes to  be empty")
        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.any)
        cancellable = recipesController
            .$recipes
            .sink { recipes in
                XCTAssert(recipes.isEmpty)
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }
}
