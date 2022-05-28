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
    
    private var frames: BowlingFrames
    private(set) var currentFrame: Frame
    
    init(playerName: PlayerName, pinCountReader: PinCountReader) {
        self.playerName = playerName
        self.pinCountReader = pinCountReader
        
        let frame = NormalFrame()
        self.frames = BowlingFrames(initialFrame: frame)
        self.currentFrame = frame
    }
    
    func start() throws -> ScoreBoard {
        while true {
            let pinCount = pinCountReader.readPinCount()
            try currentFrame.save(pinCount: pinCount)
            guard let nextFrame = frames.nextFrame() else {
                break
            }
            currentFrame = nextFrame
        }
        
        return ScoreBoard(frames: frames)
    }
}
