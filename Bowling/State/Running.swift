//
//  Running.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/16.
//

import Foundation

class Running: Statable {
    func roll(falledPins: Int) -> Statable {
        return Ready()
    }
    
    func symbol() -> String {
        ""
    }
    
    func score() -> Scorable {
        Score(score: 0)
    }
    
    func calculateAdditionalScore(score: Scorable) -> Scorable {
        Score(score: 0)
    }
    
    func isFinish() -> Bool {
        false
    }
    
    func updateScore(beforeScore: Scorable) -> Scorable {
        beforeScore.roll(falledPins: 0)
    }
}
