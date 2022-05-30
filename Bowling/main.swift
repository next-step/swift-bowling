//
//  Bowling - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct BowlingPinCountReader: PinCountReader {
    func readPinCount(ofFrameIndex index: Int) -> PinCount {
        let pinCountInput = InputView.readPinCount(of: index)
        return try! PinCountParser.parse(pinCountInput: pinCountInput)
    }
}

struct DefaultBowlingGameStateDelegate: BowlingGameStateDelegate {
    func afterReceivePinCount(playerName: PlayerName, scoreBoard: ScoreBoard) {
        let format = ScoreBoardFormat(playerName: playerName, bowlingFrames: scoreBoard)
        OutputView.print(scoreBoard: format.value)
    }
}

do {
    let nameInput = InputView.readPlayerName()
    let playerName = try PlayerNameParser.parse(nameInput: nameInput)
    
    let bowlingGame = BowlingGame(playerName: playerName,
                                  pinCountReader: BowlingPinCountReader(),
                                  stateDelegate: DefaultBowlingGameStateDelegate())
    _ = try bowlingGame.start()
    
} catch(let error) {
    OutputView.print(error: error)
}

