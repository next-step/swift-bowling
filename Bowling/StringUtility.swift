//
//  StringUtility.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/26.
//

import Foundation

struct StringUtility {
    static func splitPlayersName(to convertedExpression: String) -> [String] {
        convertedExpression.components(separatedBy: ",")
    }
}
