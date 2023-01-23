//
//  SimpleGoogleSearchTestTaskUITestsLaunchTests.swift
//  SimpleGoogleSearchTestTaskUITests
//
//  Created by Azizbek Asadov on 23/01/23.
//

import XCTest
@testable import SimpleGoogleSearchTestTask

final class SimpleGoogleSearchTestTaskUITestsLaunchTests: XCTestCase {
    override class var runsForEachTargetApplicationUIConfiguration: Bool { true }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
