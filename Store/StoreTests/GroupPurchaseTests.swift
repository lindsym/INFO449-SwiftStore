//
//  GroupPurchaseTests.swift
//  Store
//
//  Created by Lindsy M on 4/18/25.
//

//
//  TwoForOneTest.swift
//  Store
//
//  Created by Lindsy M on 4/18/25.
//

import XCTest

final class GroupPurchaseTests: XCTestCase {
    
    var register = Register()
    
    override func setUpWithError() throws {
        register = Register()
    }
    
    override func tearDownWithError() throws { }
    
    //group pricing - calculated at the very end of a transaction!
    
    func testOneKetchupOneBeerAlt () {
        register.switchGroupPurchasing()
        
        register.scan(Item(name: "ketchup", priceEach: 100))
        register.scan(Item(name: "beer", priceEach: 100))
        XCTAssertEqual(180, register.total().total())
    }

    
    func testOneBeerOneKetchupAlt () {
        register.switchGroupPurchasing()
        
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "ketchup", priceEach: 100))
        XCTAssertEqual(180, register.total().total())
    }
    
    func testThreeBeer () {
        register.switchGroupPurchasing()
        
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "beer", priceEach: 100))
        XCTAssertEqual(300, register.total().total())
    }
    
    func testTwoBeerTwoKetchup () {
        register.switchGroupPurchasing()
        
        register.scan(Item(name: "beer", priceEach: 1000))
        register.scan(Item(name: "beer", priceEach: 1000))
        register.scan(Item(name: "ketchup", priceEach: 100))
        register.scan(Item(name: "ketchup", priceEach: 100))
        XCTAssertEqual(1980, register.total().total())
    }
    
    func testTwoBeerOneKetchup () {
        register.switchGroupPurchasing()
        
        register.scan(Item(name: "beer", priceEach: 1000))
        register.scan(Item(name: "beer", priceEach: 1000))
        register.scan(Item(name: "ketchup", priceEach: 100))
        XCTAssertEqual(1990, register.total().total())
    }
    
    
    
    func testThreeBeerThreeKetchupAltAndTFO () {
        register.switchGroupPurchasing()
        register.switchTwoForOne()
        
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "ketchup", priceEach: 100))
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "ketchup", priceEach: 100))
        register.scan(Item(name: "beer", priceEach: 100))
        register.scan(Item(name: "ketchup", priceEach: 100))
        
        XCTAssertEqual(360, register.total().total())
    }
    
    
    
}


