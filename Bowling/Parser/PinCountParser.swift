//
//  PinCountParser.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/30.
//

import Foundation

struct PinCountParser {
    enum Error: LocalizedError {
        case invalidInput
    }
    
    static func parse(pinCountInput: String?) throws -> PinCount {
        return PinCount(0)!
    }
}
