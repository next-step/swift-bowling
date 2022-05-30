//
//  Bowling - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let controller: BowlingController = BowlingController()

do {
    try controller.start()
} catch {
    print("Error! \(error)")
}
