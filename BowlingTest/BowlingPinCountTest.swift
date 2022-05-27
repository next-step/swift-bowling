//
//  BowlingPinCountTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class BowlingPinCountTest: XCTestCase {
    func test_bowlingPinCount는_0미만의_값이_들어오면_nil을_반환한다() {
        XCTAssertNil(BowlingPinCount(-1))
    }
}
