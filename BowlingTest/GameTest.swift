//
//  GameTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/10.
//

import XCTest

class GameTest: XCTestCase {
    private var game: Game!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
        try super.tearDownWithError()
    }
    
    func testGame_gutterGame() {
        rollMany(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testGame_allOnes() {
        rollMany(pins: 1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testGame_OneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(pins: 0, times: 17)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testGame_OneStrike() {
        rollSpare()
        game.roll(3)
        game.roll(4)
        rollMany(pins: 0, times: 16)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testGame_perfectGame() {
        rollMany(pins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
}

private extension GameTest {
    func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
    
    func rollStrike() {
        game.roll(10)
    }
}
