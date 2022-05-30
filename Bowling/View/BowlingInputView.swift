//
//  BowlingInputView.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

struct BowlingInputView {
    
    func readName() throws -> String {
        let validEnglishRange: ClosedRange<String> = "AAA"..."ZZZ"
        
        guard let name = readInput(with: "플레이어 이름은(3 english letters)?:") else { throw BowlingError.invalidInput }
        guard validEnglishRange.contains(name), name.count == 3 else { throw BowlingError.invalidInput }
        return name
    }
    
    private func readInput(with comment: String) -> String? {
        print(comment, terminator: " ")
        let input = readLine()
        return input
    }
}
