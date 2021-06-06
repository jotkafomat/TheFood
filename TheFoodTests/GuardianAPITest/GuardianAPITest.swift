//
//  GuardianAPITest.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 06/06/2021.
//

import Combine
@testable import TheFood
import XCTest

class GuardianAPITest: XCTestCase {

    private var api: GuardianAPI!
    private let baseUrl = URL(string: "http://test.test/")
    private var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)

        api = GuardianAPI(session: session, baseUrl: baseUrl!)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        api = nil
        MockURLProtocol.requestHandler = nil
        cancellable?.cancel()
    }

    func testGetRecipesWhenRequestSuccess() throws {
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: self.baseUrl!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let data = try? Data(from: "exampleResponse")

            return (response, data)
        }
        let expectation = expectation(description: "recipes get loaded")

        cancellable = api.getLatestRecipes().sink { recipes in
            XCTAssertEqual(recipes.count, 5)
            XCTAssertEqual(recipes[0].headline, "How to use up wilted or bolted lettuce – a recipe for cheesy gratin")
            XCTAssertEqual(
                recipes[0].thumbnail,
                "https://media.guim.co.uk/e8132a7db3d2df6f49b15012412e4e068e8b1e1f/0_80_2048_1229/500.jpg")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }

    func testGetRecipesWhenReqestFails() throws {
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: self.baseUrl!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            return (response, nil)
        }
        let expectation = expectation(description: "recipes not loaded")

        cancellable = api.getLatestRecipes().sink { recipes in
            XCTAssertTrue(recipes.isEmpty)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}
