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
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

}
