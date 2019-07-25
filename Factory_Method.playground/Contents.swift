import UIKit

protocol Office {
    var desk: Int { get }
    
    func setPerson(number: Int)
}

class SmallOffice: Office {
    private var person: Int = 0
    var desk: Int {
        return self.person
    }
    
    func setPerson(number: Int) {
        self.person = number
    }
}
class MiddleOffice: Office {
    private var person: Int = 0
    
    var desk: Int {
        return self.person + 2
    }
    
    func setPerson(number: Int) {
        self.person = number
    }
}

class BigOffice: Office {
    private var person: Int = 0
    
    var desk: Int {
        return self.person + 5
    }
    
    func setPerson(number: Int) {
        self.person = number
    }
}

/// 如果根據人數定義的辦公室大小改變需重新定義初始化
let small = SmallOffice()
small.setPerson(number: 5)
print("desk number = \(small.desk)") // desk number = 5
let big = BigOffice()
big.setPerson(number: 25)
print("desk number = \(big.desk)") // desk number = 30

/// 工廠模式
/// 由 client 決定要初始化的物件
class Factory {
    static func definition(with person: Int) -> Office? {
        switch person {
        case 0...6:
            let small = SmallOffice()
            small.setPerson(number: person)
            return small
        case 7...20:
            let middle = MiddleOffice()
            middle.setPerson(number: person)
            return middle
        case 21...50:
            let big = BigOffice()
            big.setPerson(number: person)
            return big
        default:
            return nil
        }
    }
}
let person: Int = 23
let deskNumber = Factory.definition(with: person)?.desk ?? 0
print("desk number = \(deskNumber)")
