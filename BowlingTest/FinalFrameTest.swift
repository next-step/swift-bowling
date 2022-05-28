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
    
    func test_needPinCount_pinCount의_개수가_1개이하이면_true를_반환한다() {
        // given
        let frame = FinalFrame()
        guard let pinCount = PinCount(2) else {
            XCTFail()
            return
        }
        frame.save(pinCount: pinCount)
        
        // when
        let result = frame.needPinCount()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_needPinCount_pinCount의_개수가_2개일때_miss상태이면_false를_반환한다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(0),
              let secondPinCount = PinCount(9) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        
        // when
        let result = frame.needPinCount()
      
        // then
        XCTAssertFalse(result)
    }
    
    func test_needPinCount_pinCount의_개수가_2개일때_spare상태이면_true를_반환한다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(9),
              let secondPinCount = PinCount(1) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        
        // when
        let result = frame.needPinCount()
      
        // then
        XCTAssertTrue(result)
    }
    
    func test_needPinCount_pinCount의_개수가_2개일때_strike상태이면_true를_반환한다() {
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(10),
              let secondPinCount = PinCount(10) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        
        // when
        let result = frame.needPinCount()
      
        // then
        XCTAssertTrue(result)
    }
    
    func test_needPinCount_pinCount의_개수가_3개일때_false를_반환한다() {
        // given
        // given
        let frame = FinalFrame()
        guard let firstPinCount = PinCount(2),
              let secondPinCount = PinCount(8),
              let thirdPinCount = PinCount(3) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        frame.save(pinCount: thirdPinCount)
        
        // when
        let result = frame.needPinCount()
        
        // then
        XCTAssertFalse(result)
    }
}
