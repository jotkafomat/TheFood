//
//  TheFoodUITests.swift
//  TheFoodUITests
//
//  Created by Krzysztof Jankowski on 24/05/2021.
//

import XCTest

class TheFoodUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
