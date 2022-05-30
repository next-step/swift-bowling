//
//  Pins.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

struct Pins: Equatable {
    private var pins: [Int]
    
    init() {
        self.init(pins: [])
    }
    
    init(pins: [Int]) {
        self.pins = pins
    }
    
    mutating func fallDown(pinCount: Int) {
        self.pins.append(pinCount)
    }
    
    static func == (lhs: Pins, rhs: Pins) -> Bool {
        return lhs.pins == rhs.pins
    }
}
