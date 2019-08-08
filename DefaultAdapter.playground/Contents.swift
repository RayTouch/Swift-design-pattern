import UIKit

protocol HouseDataSource {
    func buy(name: String, number: Int)
    func buy(name: String, company: String)
}

class House: HouseDataSource {
    func buy(name: String, number: Int) {
        print("實作")
    }
    
    func buy(name: String, company: String) {
        print("懶得有動作")
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
