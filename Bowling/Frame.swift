//
//  Frame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

protocol Frame {
    var counts: [PinCount] { get }
    func save(pinCount: PinCount)
    func needPinCount() -> Bool
}

class NormalFrame: Frame {
    var counts = [PinCount]()
    
    private let maxPinCount = 2
    private var bowlingGame: BowlingGame?
    
    init(bowlingGame: BowlingGame? = nil) {
        self.bowlingGame = bowlingGame
    }
    
    func save(pinCount: PinCount) {
        counts.append(pinCount)
        
        if counts.count == 0 { return  }
        if counts.count == 1  {
            let sum = counts.reduce(0, { partialResult, count in
                partialResult + count.value
            })
            if sum < 10 { return }
        }
        
        guard let bowlingGame = bowlingGame else { return }

        if bowlingGame.needLastFrame() == true {
            let nextFrame = FinalFrame(bowlingGame: bowlingGame)
            bowlingGame.changeCurrenFrame(frame: nextFrame)
            return
        }
        
        let nextFrame = NormalFrame(bowlingGame: bowlingGame)
        bowlingGame.changeCurrenFrame(frame: nextFrame)
        return
    }
    
    func needPinCount() -> Bool {
        if counts.count == 0 { return true }
        if counts.count == maxPinCount { return false }
        let sum = counts.reduce(0, { partialResult, count in
            partialResult + count.value
        })
        return sum < 10
    }
}

class FinalFrame: NormalFrame {}
