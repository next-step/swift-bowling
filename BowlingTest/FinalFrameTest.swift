//
//  FinalFrameTest.swift
//  BowlingTest
//
//  Created by 이우섭 on 2022/05/31.
//

import XCTest

class FinalFrameTest: XCTestCase {
    var sut: FinalFrame = FinalFrame()
    
    override func setUpWithError() throws {
        sut = FinalFrame()
    }
    
    func test_첫_투구에_10핀을_쓰러트리면_보너스_투구를_두번_가짐() {
        sut.roll(fallDown: 10)
        
        let expected: Int = 2
        
        XCTAssertEqual(sut.bonusFrames.count, expected)
    }
    
    func test_두번에_걸처_10핀을_쓰러트리면_보너스_투구를_한번_가짐() {
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 1)
        
        let expected: Int = 1
        
        XCTAssertEqual(sut.bonusFrames.count, expected)
    }
}
