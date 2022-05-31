//
//  FinalFrame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/31.
//

import Foundation

class FinalFrame: Frame {
    var bonusFrames: Frames = Frames()
    
    override var description: String {
        var description: String = state.description
        for index in 0..<bonusFrames.count {
            description.append(bonusFrames.getFrame(by: index).description)
        }
        return description
    }
    
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
        guard let bonusFrame = bonusFrames.findNeedRollFrame() as? BonusFrame else { return }
        bonusFrame.roll(fallDown: pin)
    }
}

class BonusFrame: Frame {
    override var description: String {
        if state == .needToRoll(first: nil) { return "" }
        return "|\(state.description)"
    }
}
