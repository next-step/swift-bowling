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
        guard let pinCount = PinCount(9) else {
            XCTFail()
            return
        }
        
        // when
        frame.save(pinCount: pinCount)
        
        // then
        XCTAssertTrue(frame.counts.contains { $0.value == pinCount.value })
    }
    
    func test_needPinCount_현재_frame을_끝내기위해_Count가_더필요하면_true를_반환한다() {
        // given
        let frame = NormalFrame()
        
        // when
        let result = frame.needPinCount()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_needPinCount_현재_frame을_끝내기위해_Count가_더필요하지않으면_false를_반환한다() {
        // given
        let frame = NormalFrame()
        
        guard let firstPinCount = PinCount(2),
              let secondPinCount = PinCount(8) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        
        // when
        let result = frame.needPinCount()
        
        // then,
        XCTAssertFalse(result)
    }
}
