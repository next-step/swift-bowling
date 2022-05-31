//
//  PlayerTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/31.
//

import XCTest

class PlayerTest: XCTestCase {
    func testPlayer_make_success() {
        let player = Player(name: "만사")
        
        XCTAssertNotNil(player)
    }
    
    func testPlayer_getName() {
        let player = Player(name: "만사")
        
        XCTAssertEqual(player.getName(), "만사")
    }
    
    func testPlayer_roll() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 6))
        
        XCTAssertEqual(player.getFinishedFrame(), 1)
    }
    
    func testPlayer_isEnd_success() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 10))
        
        XCTAssertEqual(player.isEnd(), true)
    }
    
    func testPlayer_isEnd_fail() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 9))
        
        XCTAssertEqual(player.isEnd(), false)
    }
    
    func testPlayer_isFinalFrame() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 9))
        
        XCTAssertEqual(player.isFinalFrame(), false)
    }
    
    func testPlayer_nextFrame() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 9))
        
        XCTAssertNotNil(player.nextFrame())
    }
    
    func testPlayer_updateFrame() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 9))
        
        XCTAssertNotNil(player.updateFrame())
    }
    
    func testPlayer_framesSymbol_strike() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 10))
        
        XCTAssertEqual(player.framesSymbol(index: 0), "X")
    }
    
    func testPlayer_framesSymbol_spare() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 9))
        player.roll(falledPins: Pins(fallen: 1))
        
        XCTAssertEqual(player.framesSymbol(index: 0), "9|/")
    }
    
    func testPlayer_framesSymbol_miss() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 7))
        player.roll(falledPins: Pins(fallen: 2))
        
        XCTAssertEqual(player.framesSymbol(index: 0), "7|2")
    }
    
    func testPlayer_framesScore() {
        let player = Player(name: "만사")
        player.roll(falledPins: Pins(fallen: 7))
        
        XCTAssertEqual(player.framesScore(index: 0), 7)
        
        player.roll(falledPins: Pins(fallen: 2))
        
        XCTAssertEqual(player.framesScore(index: 0), 9)
    }
}
