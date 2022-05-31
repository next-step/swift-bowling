//
//  Miss.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/27.
//

import Foundation

class Miss: Finished {
    private let first: Pins
    private let second: Pins
    
    init(first: Pins, second: Pins) {
        self.first = first
        self.second = second
    }
    
    override func score() -> Scorable {
        Score(score: first.fallenPins + second.fallenPins, left: 0)
    }
    
    override func calculateAdditionalScore(score: Scorable) -> Scorable {
        var score = score.roll(falledPins: first.fallenPins)
        
        score = score.roll(falledPins: first.fallenPins)
        return score
    }
    
    override func symbol() -> String {
        first.symbol(secondPins: second)
    }
    
    override func isFinish() -> Bool {
        true
    }
    
    override func updateScore(beforeScore: Scorable) -> Scorable {
        let score = beforeScore.roll(falledPins: first.fallenPins)
        
        if beforeScore.canCalculateScore() {
            return beforeScore.roll(falledPins: first.fallenPins)
        }
        
        return score
    }
}
