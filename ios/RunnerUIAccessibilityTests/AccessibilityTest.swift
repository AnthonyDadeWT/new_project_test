//
//  AccessibilityTest.swift
//  RunnerUITests
//
//  Created by Mia Brunal on 2/16/24.
//

import XCTest

final class AccessiblityTests: XCTestCase {
    func testAccessibilityAudits() throws {
        let app = XCUIApplication()
        app.launch()

        if #available(iOS 17.0, *) {
            try app.performAccessibilityAudit()
        } else {
            // Fallback on earlier versions
            // This automated test is only possible on ios 17
            // Regular regression testing on earlier versions will
            // include regular accessibily testing
        }
    }
}
