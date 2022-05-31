//
//  BowlingController.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/30.
//

import Foundation

struct BowlingController {
    let inputView = BowlingInputView()
    let outputView = BowlingOutputView()
    
    func start() throws {
        let playerName = try inputView.readName()
        let frames: Frames = Frames.generateBowlingFrames()
        outputView.printBowlingBoard(playerName: playerName, about: frames)
    
        for index in 1...9 {
            try playFrame(name: playerName, current: index, frames: frames)
        }
    }
    
    private func playFrame(name: String, current index: Int, frames: Frames) throws {
        let frame = frames.getFrame(by: index - 1)
        while !frame.isEnd {
            let fallenPin = try inputView.readPin(frameIndex: index)
            frame.roll(fallDown: fallenPin)
            outputView.printBowlingBoard(playerName: name, about: frames)
        }
    }
}
