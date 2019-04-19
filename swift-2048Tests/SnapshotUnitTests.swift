//
//  SnapshotUnitTests.swift
//  swift-2048Tests
//
//  Created by a.alterpesotskiy on 19/04/2019.
//  Copyright © 2019 Austin Zheng. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import swift_2048

class SnapshotUnitTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = true
        continueAfterFailure = true
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Snapshot() {
        let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
        game.view.backgroundColor = UIColor.green
        game.view.layer.backgroundColor = UIColor.red.cgColor
        (game.view.subviews.last! as! ScoreView).label.text
            = "This is a really long text and should overflow"
        
        FBSnapshotVerifyView(game.view, identifier: "wholeView")
        FBSnapshotVerifyView(game.board!, identifier: "boardView")
        FBSnapshotVerifyLayer(game.board!.layer, identifier: "boardLayer")
        FBSnapshotVerifyLayer((game.view.layer.sublayers?.last)!,
                              identifier: "scoreSublayer")
    }
    
    func test_Created_Layer_Snapshot() {
        let newLayer = CALayer()
        newLayer.frame = CGRect(x: 33, y: 33, width: 50, height: 50)
        newLayer.backgroundColor = UIColor.purple.cgColor
        FBSnapshotVerifyLayer(newLayer)
    }
    
}
