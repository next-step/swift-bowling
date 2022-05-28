//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by 이우섭 on 2022/05/29.
//

import XCTest

class BowlingTest: XCTestCase {
    func test_모든_핀을_한번에_쓰러트리면_스트라이크() {
        var sut: Frame = Frame()
        sut.roll(fallDown: 10)
        
        let expected: FrameState = .strike
        
        XCTAssertEqual(sut.state, expected)
    }
    
    func test_모든_핀을_두번에_나누어_쓰러트리면_스페어() {
        var sut: Frame = Frame()
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 1)
        
        let expected: FrameState = .spare
        
        XCTAssertEqual(sut.state, expected)
    }
    
    func test_모든_핀을_쓰러트리지_못했지만_하나라도_쓰러트리면_Miss() {
        var sut: Frame = Frame()
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 0)
        
        let expected: FrameState = .miss
        
        XCTAssertEqual(sut.state, expected)
    }
}
