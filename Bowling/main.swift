//
//  Bowling - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func main() {
    let rawPlayers = InputView.readPlayer()
    let playerNames = StringUtility.splitPlayersName(to: rawPlayers)
    let game = BowlingGame(with: playerNames)
    
    for frameNumber in 1..<11 {
        game.forEachPlayers { player in
            while !game.isEndFrame(player: player) {
                game.roll(player: player, falledPins: InputView.readFallenPins(frameNumber: frameNumber))
                ResultView.printGame(game)
            }
            
            if frameNumber < 11 {
                player.updateFrame()
            }
        }
    }
}

main()
