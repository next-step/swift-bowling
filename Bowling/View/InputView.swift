//
//  InputView.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/26.
//

import Foundation

struct InputView {
    static func readPlayerName() -> String? {
        print("플레이어 이름은(3 english letters)?:", terminator: " ")
        return readLine()
    }
}
