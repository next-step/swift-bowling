//
//  NormalFrame.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/14.
//

import Foundation

class NormalFrame: FrameProtocol {
    static let maxFrameNumber: Int = 10
    private var number: Int
    private var score: Int
    private var nextFrame: FrameProtocol?
    private var state: Statable
    
    init(number: Int) {
        self.number = number
        self.state = Ready()
        self.score = 0
    }
    
    func roll(pins: Pins) {
        state = state.roll(falledPins: pins.fallenPins)
        
        if state.isFinish() {
            nextFrame = next()
        }
    }
    
    func getNextFrame() -> FrameProtocol? {
        nextFrame
    }
    
    private func next() -> FrameProtocol {
        if number == NormalFrame.maxFrameNumber {
            nextFrame = FinalFrame()
            return nextFrame ?? FinalFrame()
        }
        
        nextFrame = NormalFrame(number: number + 1)
        return nextFrame ?? NormalFrame(number: number + 1)
    }
    
    func isFinalFrame() -> Bool {
        false
    }
    
    func isEnd() -> Bool {
        state.isFinish()
    }
    
    func isStrike() -> Bool {
        state.symbol() == Strike.strikeSymbol()
    }
    
    func makeScore(beforeScore: Int) -> Scorable {
        state.score().calculateScore(beforeScore: beforeScore)
    }
    
    func getScore(beforeScore: Scorable) -> Int {
        let score = makeScore(beforeScore: beforeScore.getScore())
        
        if score.canCalculateScore() {
            return score.getScore()
        }
        
        if nextFrame != nil {
            return (nextFrame?.calculateAdditionalScore(beforeScore: score)) ?? 0
        }
        
        return 0
    }

    func calculateAdditionalScore(beforeScore: Scorable) -> Int {
        var score = beforeScore
        
        if !Ready.isReady(state: state) {
            score = state.calculateAdditionalScore(score: score)
        }
        
        if score.canCalculateScore() {
            return score.getScore()
        }
        
        if nextFrame != nil {
            return (nextFrame?.calculateAdditionalScore(beforeScore: score)) ?? 0
        }
        
        return 0
    }
    
    func stateSymbol() -> String {
        state.symbol()
    }
}
