//
//  TipCalculator.swift
//  Unit Testing Tip Calculator
//
//  Created by Thomas George on 11/01/2023.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}

class TipCalculator {
    func calculate(total: Double, percentage: Double) throws -> Double {
        guard total >= 0.0 else {
            throw TipCalculatorError.invalidInput
        }
        return total * percentage
    }
}
