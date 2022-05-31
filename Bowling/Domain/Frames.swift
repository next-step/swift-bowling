//
//  Frames.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/31.
//

import Foundation

struct Frames {
    private var frames: [Frame] = []
    
    static func generateBowlingFrames() -> Frames {
        var frames = Frames()
        for _ in 1...9 {
            frames.append(frame: Frame())
        }
        frames.append(frame: FinalFrame())
        
        return frames
    }
    
    private mutating func append(frame: Frame) {
        frames.append(frame)
    }
    
    func getFrame(by index: Int) -> Frame {
        return frames[index]
    }
}
