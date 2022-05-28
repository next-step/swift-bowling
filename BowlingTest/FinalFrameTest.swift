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
    
    func test_save_2번째카운트의_상태가_strike일경우_3개의_pinCount를_가질수있다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(10),
              let secondPinCount = PinCount(10),
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
        XCTAssertTrue(frame.counts.contains(thirdPinCount))
    }
    
    func test_save_2번재카운트의_상태가_spare일경우_3개의_pinCount를_가질수있다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(2),
              let secondPinCount = PinCount(8),
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
        XCTAssertTrue(frame.counts.contains(thirdPinCount))
    }
}
