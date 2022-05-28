//
//  FinalFrameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/28.
//

import XCTest

class FinalFrameTest: XCTestCase {

    func test_save_2번째카운트까지_상태가_miss일경우_2개의_pinCount를_갖는다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(1),
              let secondPinCount = PinCount(2),
              let thirdPinCount = PinCount(3) else {
                  XCTFail()
                  return 
              }
        
        // when
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        frame.save(pinCount: thirdPinCount)
        
        // then
        XCTAssertTrue(frame.counts.contains(firstPinCount))
        XCTAssertTrue(frame.counts.contains(secondPinCount))
        XCTAssertFalse(frame.counts.contains(thirdPinCount))
    }
}
