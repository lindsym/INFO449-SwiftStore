//
//  WeightedTests.swift
//  Store
//
//  Created by Lindsy M on 4/18/25.
//

import XCTest

final class WeightedTests: XCTestCase {
    
    var register = Register()
    
    override func setUpWithError() throws {
        register = Register()
    }
    
    override func tearDownWithError() throws { }
    
    
    func testOneWeightedItem () {
        register.scan(WeightedItem(name: "apples",priceEach: 200, weight: 1.5))
        XCTAssertEqual(300, register.subtotal())
    }
    
    func testTwoWeightedItems () {
        register.scan(WeightedItem(name: "apples",priceEach: 200, weight: 1.5))
        register.scan(WeightedItem(name: "bananas",priceEach: 200, weight: 2.0))
        XCTAssertEqual(700, register.subtotal())
    }
    
    func testTwoWeightedItemsOneNormalItem () {
        register.scan(WeightedItem(name: "apples",priceEach: 200, weight: 1.5))
        register.scan(WeightedItem(name: "bananas",priceEach: 200, weight: 2.0))
        register.scan(Item(name: "chips", priceEach: 300))
        XCTAssertEqual(1000, register.subtotal())
    }
    
    func testOneDecmialItem () {
        register.scan(WeightedItem(name: "apples",priceEach: 200, weight: 0.95))
        XCTAssertEqual(190, register.subtotal())
    }
    
}


