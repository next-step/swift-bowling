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
        
        var errorDescription: String? {
            switch self {
            case .invalidInput: return "투구로 쓰러뜨린 핀의 개수는 0개 이상이어야 합니다"
            }
        }
    }
    
    static func parse(pinCountInput: String?) throws -> PinCount {
        guard let pinCountInput = pinCountInput,
              let pinCountNumber = Int(pinCountInput),
              let pinCount = PinCount(pinCountNumber) else {
                  throw Error.invalidInput
              }

        return pinCount
    }
}
