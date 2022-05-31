//
//  Statable.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/16.
//

protocol Statable {
    func isFinish() -> Bool
    func roll(falledPins: Int) -> Statable
    func symbol() -> String
    func score() -> Scorable
    func calculateAdditionalScore(score: Scorable) -> Scorable
    func updateScore(beforeScore: Scorable) -> Scorable
}
