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
        XCTAssertEqual(recipe.headline, "Thomasina Miers’ recipe for  clotted cream drizzle cake with macerated strawberries")
        XCTAssertEqual(
            recipe.thumbnail,
            "https://media.guim.co.uk/59a765b09fa3bb95c0d60705077fdab4900d2152/0_2784_5792_3475/500.jpg")
    }
}
