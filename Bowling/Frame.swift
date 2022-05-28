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
    private(set) var counts = [PinCount]()
    private let maxPinCount = 2
    
    private var bowlingGame: BowlingGame?
    private var index: Int = 0
    
    init(bowlingGame: BowlingGame? = nil) {
        self.bowlingGame = bowlingGame
    }
    
    func save(pinCount: PinCount) {
        counts.append(pinCount)
        
        if index >= 10 { return }
        
        let nextFrame: Frame
        if index == 9 {
            nextFrame = NormalFrame(bowlingGame: bowlingGame)
            bowlingGame?.chanegCurrenFrame(frame: nextFrame)
            return
        }
        nextFrame = FinalFrame(bowlingGame: bowlingGame)
        bowlingGame?.chanegCurrenFrame(frame: nextFrame)
        return
    }
    
    func needPinCount() -> Bool {
        return counts.count < maxPinCount
    }
}

class FinalFrame: NormalFrame {}
