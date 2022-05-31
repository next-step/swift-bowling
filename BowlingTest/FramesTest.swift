//
//  FramesTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/10.
//

import XCTest

class FramesTest: XCTestCase {
    func testFrames_make_success() {
        let frames = Frames()
        
        XCTAssertNotNil(frames)
    }
    
    func testFrames_isEmpty() {
        let frames = Frames()
        
        XCTAssertTrue(frames.isEmpty())
    }
    
    func testFrames_makeFirstFrame() {
        let frames = Frames()
        let frame = frames.makeFirstFrame()
        
        XCTAssertNotNil(frame)
    }
    
    func testFrames_getFinishedFrame() {
        let frames = Frames()
        let frame = frames.makeFirstFrame()
        frames.add(frame: frame)
        
        XCTAssertEqual(frames.getFinishedFrame(), 1)
    }
    
    func testFrames_symbol() {
        let frames = Frames()
        let frame = frames.makeFirstFrame()
        frame.roll(pins: Pins(fallen: Pins.maximumFallenPins))
        frames.add(frame: frame)
        
        XCTAssertEqual(frames.symbol(index: 0), "X")
    }

    func testFrames_score() {
        let frames = Frames()
        let frame = frames.makeFirstFrame()
        frame.roll(pins: Pins(fallen: Pins.maximumFallenPins))
        frames.add(frame: frame)
        let beforeScore = Score()
        
        XCTAssertEqual(frames.score(index: 0, beforeScore: beforeScore), 10)
    }
}
    
