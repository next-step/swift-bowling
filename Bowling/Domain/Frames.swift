//
//  Frames.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/31.
//

import Foundation

struct Frames {
    private var frames: [Frame] = []
    
    var count: Int {
        return frames.count
    }
    
    static func generateBowlingFrames() -> Frames {
        var frames = Frames()
        for _ in 1...9 {
            frames.append(frame: Frame())
        }
        frames.append(frame: FinalFrame())
        
        return frames
    }
    
    static func generateBonusFrames(count: Int) -> Frames {
        var frames = Frames()
        for _ in 0..<count {
            frames.append(frame: BonusFrame())
        }
        return frames
    }
    
    private mutating func append(frame: Frame) {
        frames.append(frame)
    }
    
    func getFrame(by index: Int) -> Frame {
        return frames[index]
    }
}
