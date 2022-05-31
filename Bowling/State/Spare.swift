//
//  Spare.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/27.
//

import Foundation

class Spare: Finished {
    private let first: Pins
    private let second: Pins
    
    init(first: Pins, second: Pins) {
        self.first = first
        self.second = second
    }
    
    override func score() -> Scorable {
        Score.spare()
    }
    
    override func calculateAdditionalScore(score: Scorable) -> Scorable {
        if score.canCalculateScore() {
            return score
        }
        
        return score.roll(falledPins: Pins.maximumFallenPins)
    }
    
    override func symbol() -> String {
        first.symbol(secondPins: second)
    }
    
    override func isFinish() -> Bool {
        true
    }
    
    override func updateScore(beforeScore: Scorable) -> Scorable {
        let score = beforeScore.roll(falledPins: first.fallenPins)
        
        if !beforeScore.canCalculateScore() {
            return beforeScore.roll(falledPins: second.fallenPins)
        }
        
        return score
    }
}
