//
//  FinalFrame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/31.
//

import Foundation

class FinalFrame: Frame {
    var bonusFrames: Frames = Frames()
    
    override func roll(fallDown pin: Int) {
        super.roll(fallDown: pin)
        switch state {
        case .strike:
            bonusFrames = Frames.generateBonusFrames(count: 2)
        case .spare:
            bonusFrames = Frames.generateBonusFrames(count: 1)
        default: break
        }
    }
    
    func bonusRoll(fallDown pin: Int) {
        
    }
}

class BonusFrame: Frame {
    
}
