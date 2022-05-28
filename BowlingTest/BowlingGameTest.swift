//
//  BowlingGameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/26.
//

import XCTest
@testable import Bowling

class StubPinCountReader: PinCountReader {
    private let pinCounts: [PinCount]
    private var index = 0
    
    init(pinCounts: [PinCount]) {
        self.pinCounts = pinCounts
    }
    
    func readPinCount() -> PinCount {
        let result = pinCounts[index]
        index += 1
        return result
    }
}

class BowlingGameTest: XCTestCase {
    func test_BowlingGame_start_참가자가_친_볼링핀_카운트에따라_볼링게임을_진행하고_결과를_반환한다() throws {
        // given
        let playerName = PlayerName("jyp")!
        
        let frame1Count1 = PinCount(5)
        let frame1Count2 = PinCount(0) // gutter

        let frame2Count1 = PinCount(8)
        let frame2Count2 = PinCount(2) // spare

        let frame3Count1 = PinCount(10) // strike

        let frame4Count1 = PinCount(0)
        let frame4Count2 = PinCount(0) // gutter

        let frame5Count1 = PinCount(0)
        let frame5Count2 = PinCount(9) // miss

        let frame6Count1 = PinCount(3)
        let frame6Count2 = PinCount(5) // miss

        let frame7Count1 = PinCount(0)
        let frame7Count2 = PinCount(10) // spare

        let frame8Count1 = PinCount(10) // strike

        let frame9Count1 = PinCount(10) // strike

        let frame10Count1 = PinCount(8)
        let frame10Count2 = PinCount(2) // spare
        let frame10Count3 = PinCount(7)
        
        let pinCounts = [frame1Count1, frame1Count2,
                         frame2Count1, frame2Count2,
                         frame3Count1,
                         frame4Count1, frame4Count2,
                         frame5Count1, frame5Count2,
                         frame6Count1, frame6Count2,
                         frame7Count1, frame7Count2,
                         frame8Count1,
                         frame9Count1,
                         frame10Count1, frame10Count2, frame10Count3].compactMap { $0 }
        
        let pinCountReader = StubPinCountReader(pinCounts: pinCounts)
        let bowlingGame = BowlingGame(playerName: playerName, pinCountReader: pinCountReader)
        
        // when
        let scoreBoard = try bowlingGame.start()
        
        // then
        XCTAssertTrue(scoreBoard.frames[0].counts.contains { $0.value == frame1Count1?.value })
        XCTAssertTrue(scoreBoard.frames[0].counts.contains { $0.value == frame1Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[1].counts.contains { $0.value == frame2Count1?.value })
        XCTAssertTrue(scoreBoard.frames[1].counts.contains { $0.value == frame2Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[2].counts.contains { $0.value == frame3Count1?.value })
        
        XCTAssertTrue(scoreBoard.frames[3].counts.contains { $0.value == frame4Count1?.value })
        XCTAssertTrue(scoreBoard.frames[3].counts.contains { $0.value == frame4Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[4].counts.contains { $0.value == frame5Count1?.value })
        XCTAssertTrue(scoreBoard.frames[4].counts.contains { $0.value == frame5Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[5].counts.contains { $0.value == frame6Count1?.value })
        XCTAssertTrue(scoreBoard.frames[5].counts.contains { $0.value == frame6Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[6].counts.contains { $0.value == frame7Count1?.value })
        XCTAssertTrue(scoreBoard.frames[6].counts.contains { $0.value == frame7Count2?.value })
        
        XCTAssertTrue(scoreBoard.frames[7].counts.contains { $0.value == frame8Count1?.value })
        
        XCTAssertTrue(scoreBoard.frames[8].counts.contains { $0.value == frame9Count1?.value })
        
        XCTAssertTrue(scoreBoard.frames[9].counts.contains { $0.value == frame10Count1?.value })
        XCTAssertTrue(scoreBoard.frames[9].counts.contains { $0.value == frame10Count2?.value })
        XCTAssertTrue(scoreBoard.frames[9].counts.contains { $0.value == frame10Count3?.value })
    }
}
