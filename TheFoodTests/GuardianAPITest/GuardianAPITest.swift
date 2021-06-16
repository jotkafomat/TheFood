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

        api = GuardianAPI(session: session)
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

        cancellable = api.getLatestRecipes().compactMap(\.?.results).sink { recipes in
            XCTAssertEqual(recipes.count, 5)
            XCTAssertEqual(recipes[0].headline, "Thomasina Miers’ recipe for  clotted cream drizzle cake with macerated strawberries")
            XCTAssertEqual(
                recipes[0].thumbnail,
                URL(string: "https://media.guim.co.uk/59a765b09fa3bb95c0d60705077fdab4900d2152/0_2784_5792_3475/500.jpg")!)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }

    func testGetRecipesWhenReqestFails() throws {
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: self.baseUrl!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            return (response, nil)
        }
        let expectation = expectation(description: "result not loaded")

        cancellable = api.getLatestRecipes().sink { result in
            XCTAssertNil(result)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}
