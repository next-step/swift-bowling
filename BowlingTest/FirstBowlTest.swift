//
//  FirstBowlTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/31.
//

import XCTest

class FirstBowlTest: XCTestCase {
    func testFirstBowl_make_success() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        
        XCTAssertNotNil(firstBowl)
    }
    
    func testFirstBowl_roll() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        let roll = firstBowl.roll(falledPins: 1)
        
        XCTAssertEqual(roll.symbol(), "8|1")
    }
    
    func testFirstBowl_isFinish_false() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        
        XCTAssertFalse(firstBowl.isFinish())
    }
    
    func testFirstBowl_isFinish_true() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        let secondBowl = firstBowl.roll(falledPins: 1)
        
        XCTAssertTrue(secondBowl.isFinish())
    }
    
    func testFirstBowl_score() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        
        XCTAssertEqual(firstBowl.score().getScore(), 8)
    }
    
    func testFirstBowl_updateScore() {
        let pins = Pins(fallen: 8)
        let firstBowl = FirstBowl(fallenPins: pins)
        let beforeScore = Score(score: 1, left: 1)
        
        XCTAssertEqual(firstBowl.updateScore(beforeScore: beforeScore).getScore(), 9)
    }
}
