//
//  FrameTest.swift
//  BowlingTest
//
//  Created by 이우섭 on 2022/05/29.
//

import XCTest

class FrameTest: XCTestCase {
    var sut: Frame = Frame()
    
    override func setUpWithError() throws {
        self.sut = Frame()
    }
    
    func test_모든_핀을_한번에_쓰러트리면_스트라이크() {
        sut.roll(fallDown: 10)
        
        let expected: FrameState = .strike
        
        XCTAssertEqual(sut.state, expected)
    }
    
    func test_모든_핀을_두번에_나누어_쓰러트리면_스페어() {
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 1)
        
        let expected: FrameState = .spare(first: 9)
        
        XCTAssertEqual(sut.state, expected)
    }
    
    func test_모든_핀을_쓰러트리지_못했지만_하나라도_쓰러트리면_Miss() {
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 0)
        
        let expected: FrameState = .miss(first: 9, second: 0)
        
        XCTAssertEqual(sut.state, expected)
    }
    
    func test_핀을_하나라도_쓰러트리지_못하면_거터() {
        sut.roll(fallDown: 0)
        sut.roll(fallDown: 0)
        
        let expected = FrameState.miss(first: 0, second: 0).description
        
        XCTAssertEqual(sut.state.description, "-|-")
    }
    
    func test_핀을_쓰러트린_경우_프레임에_기록() {
        sut.roll(fallDown: 8)
        sut.roll(fallDown: 1)
        
        let expected: Pins = Pins(pins: [8, 1])
        
        XCTAssertEqual(sut.pins, expected)
    }
}
