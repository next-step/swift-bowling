//
//  Player.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/14.
//

import Foundation

protocol Playable {
    func getName() -> String
    func roll(falledPins: Pins)
    func isEnd() -> Bool
    func getFinishedFrame() -> Int
    func isFinalFrame() -> Bool
    func updateFrame()
    func framesSymbol(index: Int) -> String
    func framesTotalScore(frameIndex: Int) -> Int
}

class Player: Playable {
    private let name: String
    private var frame: FrameProtocol
    private var frames: FramesProtocol
    
    init(name: String) {
        self.name = name
        self.frames = Frames()
        self.frame = frames.makeFirstFrame()
    }
    
    func getName() -> String {
        name
    }
    
    func roll(falledPins: Pins) {
        frame.roll(pins: falledPins)
        
        if !isEnd() || frame.isStrike() {
            addFrame()
        }
    }
    
    private func addFrame() {
        frames.add(frame: frame)
    }
    
    func isEnd() -> Bool {
        frame.isEnd()
    }
    
    func getFinishedFrame() -> Int {
        frames.getFinishedFrame()
    }
    
    func isFinalFrame() -> Bool {
        frame.isFinalFrame()
    }
    
    func nextFrame() -> FrameProtocol {
        frame.getNextFrame() ?? FinalFrame()
    }
    
    func updateFrame() {
        frame = nextFrame()
    }
    
    func framesSymbol(index: Int) -> String {
        frames.symbol(index: index)
    }
    
    func framesScore(index: Int) -> Int {
        frames.score(index: index, beforeScore: Score(score: 0))
    }
    
    func framesTotalScore(frameIndex: Int) -> Int {
        var score = 0
        for index in 0..<frameIndex {
            score += framesScore(index: index)
        }
        
        return score
    }
}
