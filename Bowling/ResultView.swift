//
//  ResultView.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/26.
//

import Foundation

struct ResultView {
    static func printFormat() {
        print("| NAME |", terminator: "")
        for round in 0..<10 {
            print("  \(String(format: "%02d", round + 1))  |", terminator: "")
        }
        print()
    }
    
    static func printSymbol(player: Playable) {
        print("|  \(player.getName()) |", terminator: "")
        for index in 0..<player.getFinishedFrame() {
            print("  \(player.framesSymbol(index: index))  |", terminator: "")
        }
        print()
    }
    
    static func printTotalScore(player: Playable) {
        print("|      |", terminator: "")
        for index in 1...player.getFinishedFrame() {
            let score = player.framesTotalScore(frameIndex: index)
            print("  \(score)  |", terminator: "")
        }
        print()
    }
    
    static func printGame(_ game: BowlingGameProtocol) {
        printFormat()
        game.forEachPlayers { player in
            printSymbol(player: player)
        }
    }
}
