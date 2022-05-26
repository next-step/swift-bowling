//
//  PlayerNameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/26.
//

import XCTest

class PlayerNameTest: XCTestCase {

    func test_PlayerName은_알파벳3글자여야한다_아니면_nil을_반환한다() {
        XCTAssertNil(PlayerName("abcd"))
    }
}

