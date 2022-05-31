//
//  FinalFrame.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/14.
//

import Foundation

class FinalFrame: FrameProtocol {
    static let firstState: Int = 0
    static let maxState: Int = 3
    
    private var states: [Statable] = []
    private var state: Statable = StateFactory.ready()
    private var index: Int = 0
    
    func roll(pins: Pins) {
        state = state.roll(falledPins: pins.fallenPins)
    }
    
    func isEnd() -> Bool {
        true
    }
    
    func stateSymbol() -> String {
        state.symbol()
    }
    
    func makeScore(beforeScore: Int) -> Scorable {
        states[0].score().calculateScore(beforeScore: beforeScore)
    }
    
    func getScore(beforeScore: Scorable) -> Int {
        let score = makeScore(beforeScore: beforeScore.getScore())
        
        if score.canCalculateScore() {
            return score.getScore()
        }
        
        return calculateAdditionalScore(beforeScore: beforeScore)
    }
    
    func getNextFrame() -> FrameProtocol? {
        nil
    }
    
    func isFinalFrame() -> Bool {
        true
    }
    
    func calculateAdditionalScore(beforeScore: Scorable) -> Int {
        var score = beforeScore
        
        for index in 0..<states.count {
            score = states[index].updateScore(beforeScore: score)

            if score.canCalculateScore() {
                return score.getScore()
            }
        }
        
        return 0
    }
    
    func isStrike() -> Bool {
        state.symbol() == Strike.strikeSymbol()
    }
}
