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
        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.successLastPage)

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

    func testCanLoadMoreTrueWhenRecipesPublisherReturnsResponseWithMorePages() {
        let expectation = expectation(description: "can load more is true")

        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.successHasMorePages)
        cancellable = recipesController.objectWillChange
            .delay(
                for: RunLoop.SchedulerTimeType.Stride(0.0.nextUp),
                scheduler: RunLoop.current)
            .sink { _ in
                XCTAssert(recipesController.canLoadMorePages)
                expectation.fulfill()
            }
        waitForExpectations(timeout: 1.0)
    }

    func testCanLoadMoreFalseWhenRecipesPublisherReturnsResponseWithLastPage() {
        let expectation = expectation(description: "can load more is false")

        let recipesController = RecipesController(recipesPublisher: MockRecipesPublisher.successLastPage)

        cancellable = recipesController.objectWillChange
            .delay(
                for: RunLoop.SchedulerTimeType.Stride(0.0.nextUp),
                scheduler: RunLoop.current)
            .sink { _ in
                XCTAssertFalse(recipesController.canLoadMorePages)
                expectation.fulfill()
            }
        waitForExpectations(timeout: 1.0)
    }
}
