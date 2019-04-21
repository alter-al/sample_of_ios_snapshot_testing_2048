//
//  SnapshotUITests.swift
//  snapshotUITests
//
//  Created by a.alterpesotskiy on 19/04/2019.
//  Copyright © 2019 Austin Zheng. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SnapshotUITests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = ProcessInfo.processInfo.environment["RECORD_MODE"] == "true"
        fileNameOptions = [
            FBSnapshotTestCaseFileNameIncludeOption.OS,
            FBSnapshotTestCaseFileNameIncludeOption.screenScale
        ]
        continueAfterFailure = true
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
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
        
        FBSnapshotVerifyView(UIImageView(image: fullscreen),
                             identifier: "fullscreen",
                             perPixelTolerance: 0.1)
        FBSnapshotVerifyView(UIImageView(image: scoreImage),
                             identifier: "score",
                             overallTolerance: 0.01)
    }

}
