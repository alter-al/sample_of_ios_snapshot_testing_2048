//
//  SnapshotUnitTests_PF.swift
//  swift-2048Tests
//
//  Created by Alexey Alter Pesotskiy on 15/09/2019.
//  Copyright © 2019 Austin Zheng. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import swift_2048

class SnapshotPointFreeco: XCTestCase {
    
    override func setUp() {
        super.setUp()
        record = ProcessInfo.processInfo.environment["RECORD_MODE"] == "true"
        continueAfterFailure = true
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
        let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
        game.board?.reset()
        game.board?.insertTile(at: (1, 1), value: 2)
        (game.view.subviews.last! as! ScoreView).label.text = "12345678"
        
        assertSnapshot(matching: game, as: .image(on: .iPhoneX), testName: testName())
        assertSnapshot(matching: game, as: .recursiveDescription(on: .iPhone8), testName: testName())
        assertSnapshot(matching: game, as: .hierarchy, testName: testName())
    }
    
}
