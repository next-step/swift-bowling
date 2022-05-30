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
    
    func readPin(frameIndex: Int) throws -> Int {
        let validPinRage: ClosedRange<Int> = 0...10
        
        guard let input = readInput(with: "\(frameIndex)프레임 투구 :") else { throw BowlingError.invalidInput }
        guard let pin = Int(input), validPinRage.contains(pin) else { throw BowlingError.invalidInput }
        return pin
    }
    
    private func readInput(with comment: String) -> String? {
        print(comment, terminator: " ")
        let input = readLine()
        return input
    }
}
