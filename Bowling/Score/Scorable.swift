//
//  Scorable.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/12.
//

protocol Scorable {
    func roll(falledPins: Int) -> Scorable
    func canCalculateScore() -> Bool
    func getScore() -> Int
    func getLeft() -> Int
    func calculateScore(beforeScore: Int) -> Scorable
}
