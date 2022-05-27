//
//  String + Extension.swift
//  Bowling
//
//  Created by nylah.j on 2022/05/27.
//
 
import Foundation

extension String {
    var containsOnlyAlphabet: Bool {
        range(of: "[a-zA-Z]", options: .regularExpression) == nil
    }
}
