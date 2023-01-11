//
//  When_Calculate_Tip_Based_On_Negative_Amount.swift
//  UnitTests
//
//  Created by Thomas George on 11/01/2023.
//

import XCTest

final class When_Calculate_Tip_Based_On_Negative_Amount: XCTestCase {
    func test_should_throw_invalid_input_exception() {
        let tipCalculator = TipCalculator()
        XCTAssertThrowsError(try tipCalculator.calculate(total: -20, percentage: 0.1)) { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
    }
}
