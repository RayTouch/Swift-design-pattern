import UIKit

protocol AbstractFactory {
    func show()
}

class FactoryA: AbstractFactory {
    func show() {
        print("這裡是工廠A")
    }
}
class FactoryB: AbstractFactory {
    func show() {
        print("這裡是工廠B")
    }
}

class Factory {
    static func get(factory: String) -> AbstractFactory {
        switch factory {
        case "A":
            return FactoryA()
        default:
            return FactoryB()
        }
    }
}

Factory.get(factory: "A").show()
Factory.get(factory: "B").show()
