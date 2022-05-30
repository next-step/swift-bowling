//
//  OutputView.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/30.
//

import Foundation

struct OutputView {
    static func print(error: Error) {
        if let error = error as? LocalizedError {
            Swift.print(error.errorDescription ?? "")
            return
        }
        Swift.print(error.localizedDescription)
    }
}
