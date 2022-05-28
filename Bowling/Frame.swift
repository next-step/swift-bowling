//
//  Frame.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/29.
//

import Foundation

struct Frame {
    var state: FrameState = .none
    
    mutating func roll(fallDown pin: Int) {
        if pin == 10 {
            state = .strike
        }
    }
}
