//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by 이우섭 on 2022/05/29.
//

import XCTest

class BowlingTest: XCTestCase {
    func test_모든_핀을_한번에_쓰러트리면_스트라이크() {
        let sut: Frame = Frame()
        sut.roll(10)
        
        let expected: FrameState = .strike
        
        XCTAssertEqual(sut.state, .strike)
    }
}
