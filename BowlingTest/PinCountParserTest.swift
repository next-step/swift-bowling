//
//  PinCountParserTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/30.
//

import XCTest
@testable import Bowling

class PinCountParserTest: XCTestCase {

    func test_parse_문자열을_PinCount인스턴스로_파싱해_반환한다() throws {
        // given
        let input = "0"
        
        // when
        let pinCount = try PinCountParser.parse(pinCountInput: input)
        
        // then
        XCTAssertEqual(pinCount, PinCount(0)!)
    }
}
