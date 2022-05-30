//
//  BowlingOutputView.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

struct BowlingOutputView {
    
    func printFrameGuide() {
        let frameNumbers: Array<Int> = Array(1...10)
        print("|", terminator: "")
        printFrame(description: "NAME")
        frameNumbers.forEach({
            printFrame(description: String(format: "%02d", $0))
        })
        print()
    }
    
    func printPlayerFrame(name: String, frames: [Frame]) {
        print("|", terminator: "")
        printFrame(description: name)
        frames.forEach({
            printFrame(description: $0.state.description)
        })
        print()
    }
    
    private func printFrame(description: String) {
        var frame: String = description.count > 3 ? " " : "  "
        frame.append(description)
        let emptyCount = 6 - frame.count
        for _ in 0..<emptyCount {
            frame.append(" ")
        }
        print(frame, terminator: "|")
    }
}
