//
//  BowlingFramesFormat.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/29.
//

import Foundation

struct BowlingFramesFormat {
    private let scoreBoard: ScoreBoard
    private let playerName: PlayerName
    
    var value: String {
        let bowlingFrames = scoreBoard.frames
        
        let header = formatFrameIndex(with: bowlingFrames.value.count)
        let name = "|  \(playerName.value) |"
        
        let normalFrames = bowlingFrames.value
            .filter({ ($0 is FinalFrame) == false })
            .compactMap { $0 as? NormalFrame }
        let finalFrames = bowlingFrames.value
            .filter({ $0 is FinalFrame })
            .compactMap { $0 as? FinalFrame }
        
        let normalFramesText = normalFrames.reduce("") { partialResult, frame in
            partialResult + format(normalFrame: frame)
        }
        
        let finalFramesText = finalFrames.reduce("") { partialResult, frame in
            partialResult + format(finalFrame: frame)
        }
        
        return header + name + normalFramesText + finalFramesText
    }
    
    private func format(normalFrame: NormalFrame) -> String {
        if normalFrame.counts[0].value == BowlingConstant.pinCountOfStrike {
            return frameText(value: "X")
        }
        
        let formattedScores = format(firstScore: normalFrame.counts[0].value, secondScore: normalFrame.counts[1].value)
        return frameText(value: formattedScores)
    }
    
    
    private func format(firstScore: Int, secondScore: Int) -> String {
        let firstScoreText = format(firstScore: firstScore)
        
        if secondScore == BowlingConstant.pinCountOfStrike {
            return firstScoreText + "|" + "X"
        }
        
        if firstScore + secondScore == BowlingConstant.pinCountOfStrike {
            return firstScoreText + "|" + "/"
        }
        
        if secondScore == 0 {
            return firstScoreText + "|" + "-"
        }
        
        return firstScoreText + "|" + "\(secondScore)"
    }
    
    private func format(firstScore: Int) -> String {
        if firstScore == 0 {
            return "-"
        }
        return "\(firstScore)"
    }
    
    private func formatFrameIndex(with frameTotalCount: Int) -> String {
        var result = (1...frameTotalCount).reduce("| NAME |") { partialResult, index in
            if index == BowlingConstant.maxFrameCount {
                return partialResult + frameText(value: "\(index)")
            }
            return partialResult + frameText(value: "0\(index)")
            
        }
        
        result += "\n"
        return result
    }
    
    private func format(finalFrame: FinalFrame) -> String {
        let firstCount = finalFrame.counts[0].value
        let secondCount = finalFrame.counts[1].value
        
        let formattedScores = format(firstScore: firstCount, secondScore: secondCount)
        
        if firstCount == BowlingConstant.pinCountOfStrike
            || secondCount == BowlingConstant.pinCountOfStrike
            || firstCount + secondCount == BowlingConstant.pinCountOfStrike {
            let result = formattedScores + "|" + format(pinCount: finalFrame.counts[2])
            return frameText(value: result)
        }
        return frameText(value: formattedScores)
    }
    
    func format(pinCount: PinCount) -> String {
        if pinCount.value == 0 {
            return "-"
        }
        if pinCount.value == BowlingConstant.pinCountOfStrike {
            return "X"
        }
        return "\(pinCount.value)"
    }
    
    init(playerName: PlayerName, bowlingFrames: ScoreBoard) {
        self.playerName = playerName
        self.scoreBoard = bowlingFrames
    }
    
    func frameText(value: String) -> String {
        if value.count == 1 {
            return "  \(value)   |"
        }
        if value.count == 2 {
            return "  \(value)  |"
        }
        if value.count == 3 {
            return "  \(value) |"
        }
        if value.count == 5 {
            return "\(value) |"
        }
        return ""
    }
}
