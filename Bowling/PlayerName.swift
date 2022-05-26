//
//  PlayerName.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct PlayerName {
    let value: String
    
    init?(_ value: String) {
        if value.count > 3 {
            return nil
        }
        self.value = value
    }
}
