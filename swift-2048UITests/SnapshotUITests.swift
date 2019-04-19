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
        recordMode = true
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
        XCUIApplication().buttons["startGame"].tap()
        let element = XCUIApplication().otherElements["board"].screenshot().image
        let fullscreen = XCUIApplication().screenshot().image.removingStatusBar
        
        FBSnapshotVerifyView(UIImageView(image: fullscreen),
                             identifier: "fullscreen",
                             perPixelTolerance: 0.1)
        FBSnapshotVerifyView(UIImageView(image: element),
                             identifier: "board",
                             overallTolerance: 0.01)
    }

}
