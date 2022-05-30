//
//  BowlingOutputView.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

struct BowlingOutputView {
    
    func printBowlingBoard(playerName: String, about frames: Frames) {
        printFrameGuide()
        printPlayerFrame(name: playerName, frames: frames)
        print()
    }
    
    private func printFrameGuide() {
        let frameNumbers: Array<Int> = Array(1...10)
        print("|", terminator: "")
        printFrame(description: "NAME")
        frameNumbers.forEach({
            printFrame(description: String(format: "%02d", $0))
        })
        print()
    }
    
    private func printPlayerFrame(name: String, frames: Frames) {
        print("|", terminator: "")
        printFrame(description: name)
        let emptyCount = 10 - frames.count
        for frameIndex in 0..<frames.count {
            let frame = frames.getFrame(by: frameIndex)
            printFrame(description: frame.state.description)
        }
        for _ in 0..<emptyCount {
            printFrame(description: "")
        }
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
