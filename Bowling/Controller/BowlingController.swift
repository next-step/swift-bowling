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
        var frames: Frames = Frames()
        outputView.printBowlingBoard(playerName: playerName, about: frames)
        
        var frames
        while frames.count < 9 {
            let fallenPin = try inputView.readPin(frameIndex: frames.count+1)
            frame.roll(fallDown: fallenPin)
            if let nextFrame = frame.goToNextFrame() {
                frames.append(frame: frame)
                frame = nextFrame
            }
            outputView.printBowlingBoard(playerName: playerName, about: frames)
        }
        
        print(frames.count)
    }
}
