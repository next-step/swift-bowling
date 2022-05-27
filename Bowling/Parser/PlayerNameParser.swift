//
//  PlayerNameParser.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct PlayerNameParser {
    enum Error: LocalizedError {
        case invalid
        var errorDescription: String? {
            switch self {
            case .invalid: return "플레이어의 이름은 알파벳 3글자여야 합니다."
            }
        }
    }
    
    static func parse(nameInput: String?) throws -> PlayerName {
        guard let nameInput = nameInput,
              let playerName = PlayerName(nameInput) else {
                  throw Error.invalid
              }
        return playerName
    }
}
