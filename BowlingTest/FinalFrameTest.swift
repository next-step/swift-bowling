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
    
    func test_스페어_처리후_마지막_프레임_description() {
        sut.roll(fallDown: 9)
        sut.roll(fallDown: 1)
        
        sut.bonusRoll(fallDown: 10)
        
        let expected: String = "9|/|X"
        
        XCTAssertEqual(sut.description, expected)
    }
    
    func test_스트라이크_처리후_마지막_프레임_description() {
        sut.roll(fallDown: 10)
        
        sut.bonusRoll(fallDown: 10)
        sut.bonusRoll(fallDown: 10)
        
        let expected: String = "X|X|X"
        
        XCTAssertEqual(sut.description, expected)
    }
}
