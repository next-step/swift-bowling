//
//  PinsTest.swift
//  BowlingTest
//
//  Created by 카카오VX on 2022/05/14.
//

import XCTest

class PinsTest: XCTestCase {
    func testPins_make_success() {
        let pins = Pins(fallen: 0)
        
        XCTAssertNotNil(pins)
    }
    
    func testPins_roll() {
        let pins = Pins(fallen: 7)
        let fallenPins = pins.roll(falledPins: pins.fallenPins)
        
        XCTAssertNotNil(fallenPins)
        XCTAssertEqual(fallenPins?.fallenPins, pins.fallenPins)
    }
    
    func testPins_totalPins() {
        let firstPins = Pins(fallen: 7)
        let secondPins = Pins(fallen: 2)
        let totalPins = firstPins.totalPins(secondPins: secondPins)
        
        XCTAssertEqual(totalPins, 9)
    }
    
    func testPins_isStrike() {
        let firstPins = Pins(fallen: Pins.maximumFallenPins)
        
        XCTAssertTrue(firstPins.isStrike())
    }
    
    func testPins_isSpare() {
        let firstPins = Pins(fallen: 7)
        let secondPins = Pins(fallen: 3)
        
        XCTAssertTrue(firstPins.isSpare(secondPins: secondPins))
    }
    
    func testPins_isMiss() {
        let firstPins = Pins(fallen: 7)
        let secondPins = Pins(fallen: 2)
        
        XCTAssertTrue(firstPins.isMiss(secondPins: secondPins))
    }
    
    func testPins_isGutter() {
        let firstPins = Pins(fallen: 0)
        
        XCTAssertTrue(firstPins.isGutter())
    }
    
    func testPins_symbol_strike() {
        let firstPins = Pins(fallen: Pins.maximumFallenPins)
        
        XCTAssertEqual(firstPins.symbol(), "X")
    }
    
    func testPins_symbol_gutter() {
        let firstPins = Pins(fallen: 0)
        
        XCTAssertEqual(firstPins.symbol(), "-")
    }
    
    func testPins_symbol_spare() {
        let firstPins = Pins(fallen: 7)
        let secondPins = Pins(fallen: 3)
        
        XCTAssertEqual(firstPins.symbol(secondPins: secondPins), "7|/")
    }
    
    func testPins_symbol_miss() {
        let firstPins = Pins(fallen: 7)
        let secondPins = Pins(fallen: 2)
        
        XCTAssertEqual(firstPins.symbol(secondPins: secondPins), "7|2")
    }
}
