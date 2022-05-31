//
//  FrameProtocol.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/15.
//

protocol FrameProtocol {
    func roll(pins: Pins)
    func isEnd() -> Bool
    func stateSymbol() -> String
    func makeScore(beforeScore: Int) -> Scorable
    func getScore(beforeScore: Scorable) -> Int
    func getNextFrame() -> FrameProtocol?
    func isFinalFrame() -> Bool
    func isStrike() -> Bool
    func calculateAdditionalScore(beforeScore: Scorable) -> Int
}
