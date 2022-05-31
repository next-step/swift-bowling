//
//  FirstBowl.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/27.
//

import Foundation

class FirstBowl: Running {
    private let first: Pins
    
    init(fallenPins: Pins) {
        self.first = fallenPins
    }
    
    override func roll(falledPins fallenPins: Int) -> Statable {
        guard let pins: Pins = Pins.roll(fallenPins: fallenPins) else { return Ready() }
        
        if first.isSpare(secondPins: pins) {
            return Spare(first: first, second: pins)
        }
        
        return Miss(first: first, second: pins)
    }
    
    override func symbol() -> String {
        first.symbol()
    }
    
    override func isFinish() -> Bool {
        false
    }
    
    override func score() -> Scorable {
        Score(score: first.fallenPins)
    }
    
    override func updateScore(beforeScore: Scorable) -> Scorable {
        beforeScore.roll(falledPins: first.fallenPins)
    }
}
