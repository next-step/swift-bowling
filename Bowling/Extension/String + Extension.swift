//
//  String + Extension.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//
 
import Foundation

extension String {
    var containsOnlyAlphabet: Bool {
        if self.isEmpty { return false }
        return range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
}
