//
//  When_Calculate_Tip_Based_On_Total_Amount.swift
//  UnitTests
//
//  Created by Thomas George on 11/01/2023.
//

import XCTest

final class When_Calculate_Tip_Based_On_Total_Amount: XCTestCase {
    func test_should_calculate_tip_successfully() {
        let tipCalculator = TipCalculator()
        let tip = try! tipCalculator.calculate(total: 100, percentage: 0.1)
        XCTAssertEqual(tip, 10)
    }
}
