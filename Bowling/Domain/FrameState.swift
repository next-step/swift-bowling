//
//  FrameState.swift
//  Bowling
//
//  Created by 이우섭 on 2022/05/29.
//

import Foundation

enum FrameState: Equatable {
    case strike
    case spare(first: Int)
    case miss(first: Int, second: Int)
    case none
    
    var description: String {
        switch self {
        case .strike: return "X"
        case .spare(let first): return "\(getPinDescription(by: first))|/"
        case .miss(let first, let second): return "\(getPinDescription(by: first))|\(getPinDescription(by: second))"
        default: return ""
        }
    }
    
    private func getPinDescription(by pin: Int) -> String {
        if pin == 0 { return "-" }
        return "\(pin)"
    }
    
    static func == (lhs: FrameState, rhs: FrameState) -> Bool {
        return lhs.description == rhs.description
    }
}
