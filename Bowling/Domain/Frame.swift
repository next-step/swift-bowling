//
//  Frame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/29.
//

import Foundation

struct Frame {
    var state: FrameState = .needToRoll
    var pins: Pins = Pins()
    
    mutating func roll(fallDown pin: Int) {
        self.pins.fallDown(pinCount: pin)
        self.setCurrentState()
    }
    
    func goToNextFrame() -> Frame? {
        guard state != .needToRoll else { return nil }
        return Frame()
    }
    
    private mutating func setCurrentState() {
        self.state = pins.getState()
    }
}
