//
//  BowlingGame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/28.
//

import Foundation

struct BowlingGame {
    private let playerName: PlayerName
    private let pinCountReader: PinCountReader
    
    private var frames = [Frame]()
    private var currentFrame: Frame
    
    init(playerName: PlayerName, pinCountReader: PinCountReader) {
        self.playerName = playerName
        self.pinCountReader = pinCountReader
        self.currentFrame = NormalFrame()
        self.frames.append(self.currentFrame)
    }
    
    func start() throws -> ScoreBoard {
        while currentFrame.needPinCount() {
            let pinCount = pinCountReader.readPinCount()
            currentFrame.save(pinCount: pinCount)
        }
        
    
        let frame1Count1 = PinCount(5)!
        let frame1Count2 = PinCount(0)! // gutter

        let frame2Count1 = PinCount(8)!
        let frame2Count2 = PinCount(2)! // spare

        let frame3Count1 = PinCount(10)! // strike

        let frame4Count1 = PinCount(0)!
        let frame4Count2 = PinCount(0)! // gutter

        let frame5Count1 = PinCount(0)!
        let frame5Count2 = PinCount(9)! // miss

        let frame6Count1 = PinCount(3)!
        let frame6Count2 = PinCount(5)! // miss

        let frame7Count1 = PinCount(0)!
        let frame7Count2 = PinCount(10)! // spare

        let frame8Count1 = PinCount(10)! // strike

        let frame9Count1 = PinCount(10)! // strike

        let frame10Count1 = PinCount(8)!
        let frame10Count2 = PinCount(2)! // spare
        let frame10Count3 = PinCount(7)!
        
        let frame1 = NormalFrame()
        frame1.save(pinCount: frame1Count1)
        frame1.save(pinCount: frame1Count2)
        
        let frame2 = NormalFrame()
        frame2.save(pinCount: frame2Count1)
        frame2.save(pinCount: frame2Count2)
        
        let frame3 = NormalFrame()
        frame3.save(pinCount: frame3Count1)
        
        let frame4 = NormalFrame()
        frame4.save(pinCount: frame4Count1)
        frame4.save(pinCount: frame4Count2)
        
        let frame5 = NormalFrame()
        frame5.save(pinCount: frame5Count1)
        frame5.save(pinCount: frame5Count2)
        
        let frame6 = NormalFrame()
        frame6.save(pinCount: frame6Count1)
        frame6.save(pinCount: frame6Count2)
        
        let frame7 = NormalFrame()
        frame7.save(pinCount: frame7Count1)
        frame7.save(pinCount: frame7Count2)
        
        let frame8 = NormalFrame()
        frame8.save(pinCount: frame8Count1)
        
        let frame9 = NormalFrame()
        frame9.save(pinCount: frame9Count1)
        
        let frame10 = NormalFrame()
        frame10.save(pinCount: frame10Count1)
        frame10.save(pinCount: frame10Count2)
        frame10.save(pinCount: frame10Count3)
        
        return ScoreBoard(frames: [frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8, frame9, frame10])
    }
}
