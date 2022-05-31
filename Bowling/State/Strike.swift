//
//  Strike.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/27.
//

import Foundation

class Strike: Finished {
    override func score() -> Scorable {
        Score.strike()
    }
    
    override func calculateAdditionalScore(score: Scorable) -> Scorable {
        if score.canCalculateScore() {
            return score
        }
        
        return score.roll(falledPins: Pins.maximumFallenPins)
    }
    
    override func symbol() -> String {
        "X"
    }
    
    override func isFinish() -> Bool {
        true
    }
    
    override func updateScore(beforeScore: Scorable) -> Scorable {
        beforeScore.roll(falledPins: 10)
    }
    
    class func strikeSymbol() -> String {
        "X"
    }
}
