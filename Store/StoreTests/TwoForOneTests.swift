//
//  TwoForOneTest.swift
//  Store
//
//  Created by Lindsy M on 4/18/25.
// 

import XCTest

final class TwoForOneTests: XCTestCase {

    var register = Register()

    override func setUpWithError() throws {
        register = Register()
    }

    override func tearDownWithError() throws { }

    //2-for-1 pricing unit tests
    func testTwoSameItemsTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        XCTAssertEqual(600, register.subtotal())
    }
    
    func testThreeSameItemsTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        XCTAssertEqual(600, register.subtotal())
    }
    
    func testFourSameItemsTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        XCTAssertEqual(900, register.subtotal())
    }
    
    func testSixSameItemsTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        XCTAssertEqual(1200, register.subtotal())
    }
    
    func testThreeSameTwoDiffTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Oranges", priceEach: 200))
        register.scan(Item(name: "Oranges", priceEach: 200))
        XCTAssertEqual(1000, register.subtotal())
    }
    
    func testThreeSameThreeDiffTFO() {
        register.switchTwoForOne()
        
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Chocolate Cake Slice", priceEach: 300))
        register.scan(Item(name: "Oranges", priceEach: 200))
        register.scan(Item(name: "Oranges", priceEach: 200))
        register.scan(Item(name: "Oranges", priceEach: 200))
        XCTAssertEqual(1000, register.subtotal())
    }
    
    func testNoneTFO() {
        register.switchTwoForOne()

        XCTAssertEqual(0, register.subtotal())
    }
    
    
    
}


