//
//  GuardianAPIResponseTest.swift
//  TheFoodTests
//
//  Created by Krzysztof Jankowski on 05/06/2021.
//

@testable import TheFood
import XCTest

class GuardianAPIResponseTest: XCTestCase {
    private var data: Data!

    override func setUpWithError() throws {
        try super.setUpWithError()
        data = try Data(from: "exampleResponse")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        data = nil
    }
    func testInitFromJson() throws {
        let decoder = JSONDecoder()

        let response = try decoder.decode(GuardiaAPIResponse.self, from: data)

        XCTAssertEqual(response.recipes.count, 5)

        let recipe = try XCTUnwrap(response.recipes.first)
        XCTAssertEqual(recipe.headline, "How to use up wilted or bolted lettuce – a recipe for cheesy gratin")
        XCTAssertEqual(
            recipe.thumbnail,
            "https://media.guim.co.uk/e8132a7db3d2df6f49b15012412e4e068e8b1e1f/0_80_2048_1229/500.jpg")
    }
}
