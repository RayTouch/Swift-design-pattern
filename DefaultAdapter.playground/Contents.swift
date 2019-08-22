import UIKit

protocol HouseDataSource {
    func buy(name: String, number: Int)
    func buy(name: String, company: String)
}

class House: HouseDataSource {
    
    private var name = ""
    private var number = 0
    
    func buy(name: String, number: Int) {
        self.name = name + " Chen"
        self.number = number
        print("實作")
    }
    
    func buy(name: String, company: String) {
        print("懶得有動作")
    }
    
    func printValue() {
        print("name = \(self.name) \(self.number)")
    }
}

protocol CarDataSource: HouseDataSource {
    
}
extension CarDataSource {
    func buy(name: String, company: String) {}
}

class Car: CarDataSource {
    func buy(name: String, number: Int) {
        print("實作")
    }
}

