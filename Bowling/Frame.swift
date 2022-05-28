//
//  Frame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

fileprivate protocol Frame {
    func save(pinCount: PinCount)
}

class NormalFrame: Frame {
    private(set) var counts = [PinCount]()
    
    func save(pinCount: PinCount) {
        counts.append(pinCount)
    }
}

class FinalFrame: NormalFrame {}
