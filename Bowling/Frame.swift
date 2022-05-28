//
//  Frame.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

protocol Frame {
    var counts: [PinCount] { get }
    func save(pinCount: PinCount)
}

class NormalFrame: Frame {
    private(set) var counts = [PinCount]()
    private let maxPinCount = 2
    
    func save(pinCount: PinCount) {
        counts.append(pinCount)
    }
    
    func needPinCount() -> Bool {
        return counts.count < maxPinCount 
    }
}

class FinalFrame: NormalFrame {}
