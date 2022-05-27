//
//  BowlingPinCountTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class PinCountTest: XCTestCase {
    func test_PinCount는_0미만의_값이_들어오면_nil을_반환한다() {
        XCTAssertNil(PinCount(-1))
    }
}
