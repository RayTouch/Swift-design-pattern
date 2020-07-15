import UIKit

protocol PriceProtocol {
    var price: Int { set get }
    var totalMoney: Int { set get }
    func setPricing(money: Int)
    func setDiscount(price: Int)
}
protocol ProductProtocol {
    var name: String { set get }
    var number: Int { set get }
    func buy(number: Int)
}

class Product1: ProductProtocol, PriceProtocol {
    var price: Int = 0
    var number: Int = 0
    var name: String
    var totalMoney: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func setPricing(money: Int) {
        print("設定價格")
        self.price = money
    }
    
    func setDiscount(price: Int) {
        print("折扣")
        self.totalMoney = self.price * self.number
        guard self.number > 1 else { return }
        self.totalMoney = self.totalMoney - Int(price * self.number)
    }
    
    func buy(number: Int) {
        print("購買數量")
        self.number = number
        self.setDiscount(price: 0)
    }
}

class ChickenProduct: Product1 {
    
    override func setPricing(money: Int) {
        self.price = money
    }
    override func buy(number: Int) {
        if number > 5 {
            self.number = number + 1
        } else {
            self.number = number
        }
        self.setDiscount(price: 3)
    }
}

let chicken_1 = ChickenProduct(name: "🐔")
chicken_1.setPricing(money: 50)

chicken_1.buy(number: 2)
print("\(chicken_1.name) price = \(chicken_1.totalMoney)")

let chicken_2 = ChickenProduct(name: "🐑")
chicken_2.setPricing(money: 500)

chicken_2.buy(number: 6)
print("\(chicken_2.name) price = \(chicken_2.totalMoney)")
