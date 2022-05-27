//
//  PlayerName.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct PlayerName {
    private let letterCount = 3
    private let blank = " "
    let value: String
    
    init?(_ value: String) {
        guard value.count == letterCount
            && value.contains(blank) == false
            && value.containsOnlyAlphabet else {
            return nil
        }
        
        self.value = value
    }
}
