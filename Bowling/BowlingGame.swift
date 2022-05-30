//
//  BowlingGame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/28.
//

import Foundation

class BowlingGame {
    private let playerName: PlayerName
    private let pinCountReader: PinCountReader
    private let stateDelegate: BowlingGameStateDelegate?
    
    private var frames: BowlingFrames
    private(set) var currentFrame: Frame
    
    init(playerName: PlayerName,
         pinCountReader: PinCountReader,
         stateDelegate: BowlingGameStateDelegate? = nil) {
        self.playerName = playerName
        self.pinCountReader = pinCountReader
        self.stateDelegate = stateDelegate
        
        let frame = NormalFrame()
        self.frames = BowlingFrames(initialFrame: frame)
        self.currentFrame = frame
    }
    
    func start() throws -> ScoreBoard {
        while true {
            let index = frames.indexOf(frame: currentFrame)!
            let pinCount = pinCountReader.readPinCount(ofFrameIndex: index)
            try currentFrame.save(pinCount: pinCount)
            stateDelegate?.afterReceivePinCount(playerName: playerName, scoreBoard: ScoreBoard(frames: frames))
            guard let nextFrame = frames.nextFrame() else {
                break
            }
            currentFrame = nextFrame
            
        }
        
        return ScoreBoard(frames: frames)
    }
}
