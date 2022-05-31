//
//  Frames.swift
//  Bowling
//
//  Created by 카카오VX on 2022/05/28.
//

import Foundation

protocol FramesProtocol {
    func makeFirstFrame() -> FrameProtocol
    func isEmpty() -> Bool
    func getFinishedFrame() -> Int
    func add(frame: FrameProtocol)
    func symbol(index: Int) -> String
    func score(index: Int, beforeScore: Scorable) -> Int
}

class Frames: FramesProtocol {
    static let firstFrame: Int = 1
    static let finalFrame: Int = 10
    
    private var frames: [FrameProtocol] = []
    
    func makeFirstFrame() -> FrameProtocol {
        NormalFrame(number: Frames.firstFrame)
    }
    
    func isEmpty() -> Bool {
        frames.isEmpty
    }
    
    func getFinishedFrame() -> Int {
        frames.count
    }
    
    func add(frame: FrameProtocol) {
        frames.append(frame)
    }
    
    func symbol(index: Int) -> String {
        frames[index].stateSymbol()
    }
    
    func score(index: Int, beforeScore: Scorable) -> Int {
        frames[index].getScore(beforeScore: beforeScore)
    }
}
