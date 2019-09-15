//
//  SnapshotUITests_PF.swift
//  swift-2048UITests
//
//  Created by Alexey Alter Pesotskiy on 15/09/2019.
//  Copyright © 2019 Austin Zheng. All rights reserved.
//

import XCTest
import SnapshotTesting

class SnapshotPFUI: XCTestCase {

    override func setUp() {
        super.setUp()
        record = ProcessInfo.processInfo.environment["RECORD_MODE"] == "true"
        continueAfterFailure = true
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    private func testName(funcName: String = #function) -> String {
        let systemVersion = UIDevice.current.systemVersion
        let scale = UIScreen.main.scale
        return "\(funcName)_\(systemVersion)_\(scale)"
    }
    
    func test_Snapshot() {
        let startGameBtn = XCUIApplication().buttons["startGame"]
        let score = XCUIApplication().staticTexts["score"]
        let board = XCUIApplication().otherElements["board"]
        
        startGameBtn.tap()
        sleep(1) // in XCUITest we haven't usesDrawViewHierarchyInRect
        let scoreImage = score.screenshot().image
        let fullscreen = XCUIApplication()
                                        .screenshot()
                                        .image
                                        .fill(element: board)
                                        .removingStatusBar
        
        assertSnapshot(matching: scoreImage, as: .image, testName: testName())
        assertSnapshot(matching: fullscreen!, as: .image, testName: testName())
    }

}

