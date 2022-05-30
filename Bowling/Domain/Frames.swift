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
    
    mutating func append(frame: Frame?) {
        guard let frame = frame else { return }
        frames.append(frame)
    }
    
    func getFrame(by index: Int) -> Frame {
        return frames[index]
    }
}
