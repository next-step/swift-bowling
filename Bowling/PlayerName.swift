//
//  PlayerName.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct PlayerName {
    private let letterCount = 3
    let value: String
    
    init?(_ value: String) {
        if value.count > letterCount {
            return nil
        }
        self.value = value
    }
}
