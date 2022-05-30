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
        outputView.printFrameGuide()
        var frames = Array(1...10).compactMap({ _ in return Frame() })
        for index in 0..<frames.count {
            frames[index].roll(fallDown: 8)
            frames[index].roll(fallDown: 2)
        }
        
        outputView.printPlayerFrame(name: playerName, frames: frames)
    }
}
