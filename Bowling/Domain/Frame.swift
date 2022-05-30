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
    
    func roll(fallDown pin: Int) {
        self.pins.fallDown(pinCount: pin)
        self.setCurrentState()
    }
    
    func goToNextFrame() -> Frame? {
        if case .needToRoll(_) = state { return nil }
        return Frame()
    }
    
    private func setCurrentState() {
        self.state = pins.getState()
    }
}
