//
//  BowlingFramesTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/29.
//

import XCTest

class BowlingFramesTest: XCTestCase {
    
    func test_nextFrame_마지막Frame이_pinCount가_더필요하면_마지막Frame을_반환한다() {
        // given
        let frame = NormalFrame()
        let bowlingFrames = BowlingFrames(initialFrame: frame)
        
        // when
        let result = bowlingFrames.nextFrame()
        
        // then
        XCTAssertEqual(result?.counts, frame.counts)
    }
}
