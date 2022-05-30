//
//  Frame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/29.
//

import Foundation

struct Frame {
    var state: FrameState = .none
    
    private var fallenPins: Int = 0
    private var rollCount: Int = 0
    
    var pins: Pins = Pins()
    
    mutating func roll(fallDown pin: Int) {
        self.fallenPins += pin
        self.rollCount += 1
        self.pins.fallDown(pinCount: pin)
        
        self.setCurrentState()
    }
    
    private mutating func setCurrentState() {
        switch fallenPins {
        case 10 where rollCount == 1:
            self.state = .strike
        case 10:
            self.state = .spare
        case 1...9 where rollCount == 2:
            self.state = .miss
        case 0 where rollCount == 2:
            self.state = .gutter
        default:
            self.state = .none
        }
    }
}
