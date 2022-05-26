//
//  PlayerNameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/26.
//

import XCTest
@testable import Bowling

class PlayerNameTest: XCTestCase {

    func test_PlayerName은_알파벳3글자보다_많으면_nil을_반환한다() {
        XCTAssertNil(PlayerName("abcd"))
    }
    
    func test_PlayerName으로_공백이입력되면_nil을_반환한다() {
        XCTAssertNil(PlayerName(" "))
    }
    
    func test_PlayerName으로_알파벳이아닌것이입력되면_nil을_반환한다() {
        XCTAssertNil(PlayerName("가ab"))
    }
}

