//
//  Frame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

protocol Frame {
    var counts: [PinCount] { get }
    func save(pinCount: PinCount) throws
    func needPinCount() -> Bool
}

class NormalFrame: Frame {
    enum Error: LocalizedError {
        case invalidPinCounts
        
        var errorDescription: String? {
            switch self {
            case .invalidPinCounts: return "Frame이 가질 수 있는 Count 개수를 초과했습니다."
            }
        }
    }
    var counts = [PinCount]()
    
    private let maxPinCount = 2
    private var bowlingGame: BowlingGame?
    
    init(bowlingGame: BowlingGame? = nil) {
        self.bowlingGame = bowlingGame
    }
    
    func save(pinCount: PinCount) throws {
        if needPinCount() {
            counts.append(pinCount)
            return
        }
        
        throw Error.invalidPinCounts
    }
    
    func needPinCount() -> Bool {
        if counts.count == Int.zero { return true }
        if counts.count == maxPinCount { return false }
        return sumCountsValue() < BowlingConstant.pinCountOfStrike
    }
    
    func sumCountsValue() -> Int {
        return counts.reduce(Int.zero, { partialResult, count in
            partialResult + count.value
        })
    }
}

class FinalFrame: NormalFrame {
    override func needPinCount() -> Bool {
        if counts.count == Int.zero { return true }
        if counts.count == 1 { return true }
        return counts.count == 2 && sumCountsValue() >= BowlingConstant.pinCountOfStrike
    }
}
