//
//  ScoreTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/12.
//

import XCTest

class ScoreTest: XCTestCase {
    func testScore_make_success() {
        let score = Score(score: 6, left: 0)
        
        XCTAssertNotNil(score)
    }
    
    func testScore_roll() {
        let score = Score(score: 6, left: 0)
        let rolledScore = score.roll(falledPins: 3)
        
        XCTAssertEqual(rolledScore.getScore(), 9)
    }
    
    func testScore_getScore() {
        let score = Score(score: 6, left: 0)
        
        XCTAssertEqual(score.getScore(), 6)
    }
    
    func testScore_getLeft() {
        let score = Score(score: 10, left: 2)
        
        XCTAssertEqual(score.getLeft(), 2)
    }
    
    func testScore_calculateScore() {
        let score = Score(score: 10, left: 2)
        
        XCTAssertEqual(score.calculateScore(beforeScore: 5).getScore(), 15)
    }
    
    func testScore_canCalculateScore() {
        let score = Score(score: 10, left: 2)
        
        XCTAssertTrue(score.canCalculateScore())
    }
}
