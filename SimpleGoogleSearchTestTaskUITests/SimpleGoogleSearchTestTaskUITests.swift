//
//  SimpleGoogleSearchTestTaskUITests.swift
//  SimpleGoogleSearchTestTaskUITests
//
//  Created by Azizbek Asadov on 23/01/23.
//

import XCTest
@testable import SimpleGoogleSearchTestTask

final class SimpleGoogleSearchTestTaskUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
