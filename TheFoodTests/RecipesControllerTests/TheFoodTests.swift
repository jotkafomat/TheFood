//
//  TheFoodTests.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import Combine
@testable import TheFood
import XCTest

class TheFoodTests: XCTestCase {

    private var recipesController: RecipesController!
    private var cancellable: AnyCancellable?

    override func tearDownWithError() throws {
        try super.tearDownWithError()
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

        waitForExpectations(timeout: 1.0)
    }

    func testWhenPublisherFailToFetchRecipesArrayIsEmpty() throws {
        let expectation = expectation(description: "expect recipes to  be empty")
        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.failure)

        cancellable = recipesController
            .$recipes
            .sink { recipes in
                XCTAssert(recipes.isEmpty)
                expectation.fulfill()
            }

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
