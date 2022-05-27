//
//  StringExtensionTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

class StringExtensionTest: XCTestCase {

    func test_containsOnlyAlphabet() {
        XCTAssertTrue("asd".containsOnlyAlphabet)
        XCTAssertFalse("".containsOnlyAlphabet)
        XCTAssertFalse(" ".containsOnlyAlphabet)
    }
}
