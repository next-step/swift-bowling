//
//  BowlingPinCount.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct BowlingPinCount {
    
    let value: Int
    
    init?(_ value: Int) {
        if value < 0 { return nil }
        self.value = value
    }
}
