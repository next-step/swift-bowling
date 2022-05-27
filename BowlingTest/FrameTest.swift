//
//  FrameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class FrameTest: XCTestCase {

    func test_frame_save_핀카운트를_저장한다() {
        // given
        let frame = Frame()
        let pinCount = BowlingPinCount(9)
        
        // when
        frame.save(bowlingPinCount: pinCount)
        
        // then
        XCTAssertTrue(frame.pinCounts.contains(pinCount))
    }
}
