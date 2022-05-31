//
//  Frame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/29.
//

import Foundation

class Frame {
    var state: FrameState = .needToRoll(first: nil)
    var pins: Pins = Pins()
    
    var isEnd: Bool {
        if case .needToRoll(_) = state { return false }
        return true
    }
    
    var description: String {
        return state.description
    }
    
    func roll(fallDown pin: Int) {
        self.pins.fallDown(pinCount: pin)
        self.setCurrentState()
    }
    
    private func setCurrentState() {
        self.state = pins.getState()
    }
}
