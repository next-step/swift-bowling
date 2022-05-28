//
//  PinCount.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct PinCount: Equatable {
    private let zero = 0
    let value: Int
    
    init?(_ value: Int) {
        if value < zero { return nil }
        self.value = value
    }
}
