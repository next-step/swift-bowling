//
//  FinalFrameTest.swift
//  BowlingTest
//
//  Created by 이우섭 on 2022/05/31.
//

import XCTest

class FinalFrameTest: XCTestCase {
    var sut: FinalFrame = FinalFrame()
    
    override func setUpWithError() throws {
        sut = FinalFrame()
    }
    
    func test_첫_투구에_10핀을_쓰러트리면_보너스_투구를_두번_갖음() {
        sut.roll(fallDown: 10)
        XCTAssertEqual(sut.state, .needToRoll)
    }
}
