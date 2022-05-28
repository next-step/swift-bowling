//
//  FrameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class NormalFrameTest: XCTestCase {

    func test_NormalFrame_save_핀카운트를_저장한다() {
        // given
        let frame = NormalFrame()
        let pinCount = PinCount(9)!
        
        // when
        frame.save(pinCount: pinCount)
        
        // then
        XCTAssertTrue(frame.counts.contains { $0.value == pinCount.value })
    }
}
