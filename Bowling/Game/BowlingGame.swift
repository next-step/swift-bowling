//
//  BowlingGame.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/14.
//

import Foundation

protocol BowlingGameProtocol {
    func makePins(falledPins: Int) -> Pins
    func roll(player: Playable, falledPins: Int)
    func isEndFrame(player: Playable) -> Bool
    func forEachPlayers(behavior: (Playable) -> ())
}

class BowlingGame: BowlingGameProtocol {
    private static let first = 1
    private var players: [Playable] = []
    
    init(with names: [String]) {
        names.forEach { name in
            players.append(Player(name: name))
        }
    }
    
    func makePins(falledPins: Int) -> Pins {
        Pins(fallen: falledPins)
    }
    
    func roll(player: Playable, falledPins: Int) {
        player.roll(falledPins: makePins(falledPins: falledPins))
    }
    
    func isEndFrame(player: Playable) -> Bool {
        player.isEnd()
    }
    
    func forEachPlayers(behavior: (Playable) -> ()) {
        players.forEach(behavior)
    }
}
