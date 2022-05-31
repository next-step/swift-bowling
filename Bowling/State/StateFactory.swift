//
//  StateFactory.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/27.
//

import Foundation

class StateFactory {
    class func ready() -> Statable {
        Ready()
    }
    
    class func firstRoll(countOfPin: Int) -> Statable {
        ready().roll(falledPins: countOfPin)
    }
}
