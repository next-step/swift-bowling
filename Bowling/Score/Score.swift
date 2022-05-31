//
//  Score.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/12.
//

import Foundation

struct Score: Scorable {
    private var score: Int
    private var left: Int
    
    init(score: Int = 0, left: Int = 0) {
        self.score = score
        self.left = left
    }
    
    func roll(falledPins: Int) -> Scorable {
        let pins = Pins(fallen: falledPins)
        return Score(score: pins.sumScore(score: score) , left: left - 1)
    }
    
    func getScore() -> Int {
        score
    }
    
    func getLeft() -> Int {
        left
    }
    
    func calculateScore(beforeScore: Int) -> Scorable {
        Score(score: score + beforeScore, left: left)
    }
    
    func canCalculateScore() -> Bool {
        left == 0 || left == 1 || left == 2
    }
    
    static func strike() -> Scorable {
        Score(score: 10, left: 2)
    }

    static func spare() -> Scorable {
        Score(score: 10, left: 1)
    }
}
