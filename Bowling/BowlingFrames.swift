//
//  BowlingFrames.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

class BowlingFrames {
    private(set) var value = [Frame]()
    
    init(initialFrame: Frame) {
        value.append(initialFrame)
    }
    
    private var lastFrame: Frame { value.last! }
    
    func nextFrame() -> Frame? {
        if lastFrame.needPinCount() == true {
            return lastFrame
        }
        
        if value.count == BowlingConstant.maxFrameCount - 1 {
            let frame = FinalFrame()
            value.append(frame)
            return frame
        }
        
        if value.count == BowlingConstant.maxFrameCount {
            return nil
        }
        
        let frame = NormalFrame()
        value.append(frame)
        return frame
    }
}
