//
//  NormalFrameTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/15.
//

import XCTest

class NormalFrameTest: XCTestCase {
    func testNormalFrame_make_success() {
        let normalFrame = NormalFrame(number: 0)
        
        XCTAssertNotNil(normalFrame)
    }
    
    func testNormalFrame_roll() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 2))
        
        XCTAssertEqual(normalFrame.getScore(beforeScore: Score(score: 7, left: 1)), 9)
    }
    
    func testNormalFrame_isEnd() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 2))
        
        XCTAssertEqual(normalFrame.isEnd(), false)
        
        normalFrame.roll(pins: Pins(fallen: 2))
        
        XCTAssertEqual(normalFrame.isEnd(), true)
    }
    
    func testNormalFrame_stateSymbol() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 10))
        
        XCTAssertEqual(normalFrame.stateSymbol(), "X")
    }
    
    func testNormalFrame_makeScore() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 8))
        
        XCTAssertEqual(normalFrame.makeScore(beforeScore: 1).getScore(), Score(score: 9).getScore())
    }
    
    func testNormalFrame_nextFrame() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 8))
        
        XCTAssertNotNil(normalFrame.getNextFrame)
    }
    
    func testNormalFrame_isFinalFrame() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 8))
        
        XCTAssertFalse(normalFrame.isFinalFrame())
    }
    
    func testNormalFrame_isStrike() {
        let normalFrame = NormalFrame(number: 0)
        normalFrame.roll(pins: Pins(fallen: 10))
        
        XCTAssertTrue(normalFrame.isStrike())
    }
}
