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
    
    func getState() -> FrameState {
        let sum = pins.reduce(0, +)
        switch pins.count {
        case 1 where sum == 10: return .strike
        case 1: return .needToRoll(first: pins[0])
        case 2 where sum == 10: return .spare(first: pins[0])
        case 2: return .miss(first: pins[0], second: pins[1])
        default: return .needToRoll(first: nil)
        }
    }
    
    static func == (lhs: Pins, rhs: Pins) -> Bool {
        return lhs.pins == rhs.pins
    }
}
