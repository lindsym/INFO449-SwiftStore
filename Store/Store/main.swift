//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String { get }
    func price () -> Int
}

class Item : SKU {
    var name : String
    var priceEach : Int
    
    init(name:String, priceEach:Int) {
        self.name = name
        self.priceEach = priceEach
        
    }
    
    func price () -> Int {
        return priceEach
    }
}

class WeightedItem : Item {
    var weight: Double
        
    init (name:String, priceEach:Int, weight:Double) {
        self.weight = weight
        super.init(name: name, priceEach: priceEach)
    }
    
    override func price () -> Int {
        return Int(Double(priceEach) * weight)
    }
}

class Receipt {
    var list : [Item] = []
    
    func items () -> [Item] {
        return list
    }
    
    func output () -> String {
        var toPrint = "Receipt:\n"
        var runningTotal = 0
        if (list.count > 0) {
            for index in 0 ... list.count - 1 {
                runningTotal = runningTotal + list[index].price()
                toPrint = toPrint + list[index].name + ": $" + String((Double(list[index].price())) / 100) + "\n"
            }
        }
        toPrint = toPrint + "------------------\nTOTAL: $" + String((Double(runningTotal) / 100.0))

        return toPrint
    }
    
    func total () -> Int {
        var runningTotal = 0
        if (list.count > 0) {
            for index in 0 ... list.count - 1 {
                runningTotal = runningTotal + list[index].price()
            }
        }
        return runningTotal
    }
    
}

class Register {
    var receipt : Receipt = Receipt()
    var runningTotal = 0
    
    var twoForOneCount = 0
    var twoForOne = false
    
    var groupPurchases = false
    
    //run method to turn on 2-for-1 sale
    func switchTwoForOne () {
        twoForOne = !twoForOne
    }
    
    //run method to turn on group purchasing
    func switchGroupPurchasing () {
        groupPurchases = !groupPurchases
    }
    
    func scan (_ item: Item) {
        if (twoForOne == true && receipt.list.count > 0) {
            for index in 0...receipt.list.count - 1 {
                if (receipt.list[index].name == item.name) {
                    twoForOneCount = twoForOneCount + 1
                }
            }
            if (twoForOneCount > 0 && twoForOneCount % 2 == 0) {
                item.priceEach = 0
            }
        }
        
            receipt.list.append(item)
            runningTotal = runningTotal + item.price()
            twoForOneCount = 0
        
    }
    
    func scan (_ item: WeightedItem) {
        if (twoForOne == true && receipt.list.count > 0) {
            for index in 0...receipt.list.count - 1 {
                if (receipt.list[index].name == item.name) {
                    twoForOneCount = twoForOneCount + 1
                }
            }
            if (twoForOneCount > 0 && twoForOneCount % 2 == 0) {
                item.priceEach = 0
            }
        }
        
            receipt.list.append(item)
        runningTotal = runningTotal + item.price()
            twoForOneCount = 0
        
    }
        
        func subtotal () -> Int {
            return runningTotal
        }
        
        func total () -> Receipt {
            if (groupPurchases == true && receipt.list.count > 0) {
                var ketchup : [Int] = []
                var beer : [Int] = []
                for index in 0 ... receipt.list.count - 1 {
                    if (receipt.list[index].name.contains("ketchup")) {
                        ketchup.append(index)
                    } else if (receipt.list[index].name.contains("beer")) {
                        beer.append((index))
                    }
                }
                while (ketchup.count != 0 && beer.count != 0) {
                    receipt.list[ketchup[0]].priceEach = Int(Double(receipt.list[ketchup[0]].priceEach) * 0.9)
                    receipt.list[beer[0]].priceEach = Int(Double(receipt.list[beer[0]].priceEach) * 0.9)

                    runningTotal = runningTotal - Int(Double(receipt.list[ketchup[0]].priceEach) * 0.1) - Int(Double(receipt.list[beer[0]].priceEach) * 0.1)
                    
                    ketchup.remove(at: 0)
                    beer.remove(at: 0)
                }
            }
            
            let temp = receipt
            receipt = Receipt()
            runningTotal = 0
            return temp
        }
    }
    
    class Store {
        let version = "0.1"
        func helloWorld() -> String {
            return "Hello world"
        }
    }

