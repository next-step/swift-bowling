//
//  InputView.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/25.
//

struct InputView {
    static func read(with description: String) -> String {
        print(description)
        let line = readLine() ?? ""
        return line
    }
    
    static func readPlayer() -> String {
        return read(with: "플레이어 이름은(3 english letters)?:")
    }
    
    static func readFallenPins(frameNumber: Int) -> Int {
        return Int(read(with: "\(frameNumber)프레임 투구 :")) ?? 0
    }
}
