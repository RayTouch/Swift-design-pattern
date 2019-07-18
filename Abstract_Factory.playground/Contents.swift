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
    
    static func showMessage(factory: AbstractFactory) {
        factory.show()
    }
}

Factory.showMessage(factory: FactoryA())
Factory.showMessage(factory: FactoryB())
