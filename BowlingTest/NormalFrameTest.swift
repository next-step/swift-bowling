//
//  FrameTest.swift
//  BowlingTest
//
//  Created by nylah.j on 2022/05/27.
//

import XCTest

extension NormalFrame: Equatable {
    static func == (lhs: NormalFrame, rhs: NormalFrame) -> Bool {
        lhs.counts == rhs.counts
    }
}

class NormalFrameTest: XCTestCase {

    func test_NormalFrame_save_핀카운트를_저장한다() {
        // given
        let frame = NormalFrame()
        guard let pinCount = PinCount(9) else {
            XCTFail()
            return
        }
        
        // when
        frame.save(pinCount: pinCount)
        
        // then
        XCTAssertTrue(frame.counts.contains { $0.value == pinCount.value })
    }
    
    func test_needPinCount_현재_frame을_끝내기위해_Count가_더필요하면_true를_반환한다() {
        // given
        let frame = NormalFrame()
        
        // when
        let result = frame.needPinCount()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_needPinCount_현재_frame을_끝내기위해_Count가_더필요하지않으면_false를_반환한다() {
        // given
        let frame = NormalFrame()
        
        guard let firstPinCount = PinCount(2),
              let secondPinCount = PinCount(8) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)
        
        // when
        let result = frame.needPinCount()
        
        // then,
        XCTAssertFalse(result)
    }
    
    func test_needPinCount_NormalFrame_첫번재_카운트에서_스트라이크를_칠_경우_false를_반환한다() {
        // given
        let frame = NormalFrame()
        
        guard let firstPinCount = PinCount(10) else {
                  XCTFail()
                  return
              }
        
        frame.save(pinCount: firstPinCount)
        
        // when
        let result = frame.needPinCount()
        
        // then,
        XCTAssertFalse(result)
    }
    
    func test_NormalFrame이_사용되고있는_bowlingGame이_있을때_자신이필요한_pinCount를_모두채웠다면_bowlingGame의_frame을_다음_frame으로_교체해준다() {
        // given
        guard let playerName = PlayerName("jyp") else {
            XCTFail()
            return
        }
        let pinCountReader = StubPinCountReader(pinCounts: [])
        let bowlingGame = BowlingGame(playerName: playerName, pinCountReader: pinCountReader)
        
        let frame = NormalFrame(bowlingGame: bowlingGame)
        
        guard let firstPinCount = PinCount(2),
              let secondPinCount = PinCount(8) else {
                  XCTFail()
                  return
              }
        
        // when
        frame.save(pinCount: firstPinCount)
        frame.save(pinCount: secondPinCount)

        // then
        XCTAssertNotEqual(bowlingGame.currentFrame as! NormalFrame, frame)
    }
}
