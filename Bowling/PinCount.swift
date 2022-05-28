//
//  PinCount.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//

import Foundation

struct PinCount: Equatable {
    let value: Int
    
    init?(_ value: Int) {
        if value < Int.zero { return nil }
        self.value = value
    }
}
