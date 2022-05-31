//
//  Ready.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/16.
//

import Foundation

class Ready: Running {
    override func roll(falledPins: Int) -> Statable {
        guard let pins: Pins = Pins.roll(fallenPins: falledPins) else { return Ready() }
        
        if pins.isStrike() {
            return Strike()
        }
        
        return FirstBowl(fallenPins: pins)
    }
    
    override func symbol() -> String {
        "ready"
    }
    
    class func isReady(state: Statable) -> Bool {
        StateFactory.ready().symbol() == state.symbol()
    }
}
