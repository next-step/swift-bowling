//
//  BowlingFrames.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

class BowlingFrames {
    private(set) var value = [Frame]()
    private var lastFrame: Frame { value.last! }
    var count: Int { return value.count }
    
    init(initialFrame: Frame) {
        value.append(initialFrame)
    }
    
    subscript(index: Int) -> Frame { value[index] }
    
    func indexOf(frame: Frame) -> Int? {
        return value.firstIndex { $0.isEqual(to: frame) }
    }
    
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
