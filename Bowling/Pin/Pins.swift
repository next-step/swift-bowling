//
//  Pins.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/14.
//

import Foundation

struct Pins {
    static let maximumFallenPins = 10
    static let minimumFallenPins = 0
    
    let fallenPins: Int
    
    init(fallen: Int) {
        self.fallenPins = fallen
    }
        
    func roll(falledPins: Int) -> Pins? {
        Pins(fallen: fallenPins)
    }
    
    func totalPins(secondPins: Pins) -> Int {
        let totalPins: Int = fallenPins + secondPins.fallenPins
        return totalPins
    }
    
    func isStrike() -> Bool {
        fallenPins == Pins.maximumFallenPins
    }
    
    func isSpare(secondPins: Pins) -> Bool {
        totalPins(secondPins: secondPins) == Pins.maximumFallenPins
    }
    
    func isMiss(secondPins: Pins) -> Bool {
        totalPins(secondPins: secondPins) < Pins.maximumFallenPins
    }
    
    func isGutter() -> Bool {
        fallenPins == Pins.minimumFallenPins
    }
    
    func sumScore(score: Int) -> Int {
        fallenPins + score
    }
    
    func symbol() -> String {
        if isGutter() { return "-" }
        if isStrike() { return "X" }
        return "\(fallenPins)|"
    }
    
    func symbol(secondPins: Pins) -> String {
        if isSpare(secondPins: secondPins) { return "\(fallenPins)|/" }
        return "\(scoreOrGutter(fallenPins: fallenPins))|\(scoreOrGutter(fallenPins: secondPins.fallenPins))"
    }
    
    private func scoreOrGutter(fallenPins: Int) -> String {
        if isGutter() { return "-" }
        return "\(fallenPins)"
    }
    
    static func roll(fallenPins: Int) -> Pins? {
        Pins(fallen: fallenPins)
    }
}
