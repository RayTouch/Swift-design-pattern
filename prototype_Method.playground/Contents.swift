import UIKit

struct ByValuePerson {
    var weight: Double
    var height: Double

    func printValue(name: String) {
        print("\(name) 重:\(weight) 高:\(height)")
    }
}

let person1 = ByValuePerson(weight: 100, height: 100)

var person2 = person1
person2.height = 30

person1.printValue(name: "one") // one 重:100.0 高:100.0
person2.printValue(name: "two") // two 重:100.0 高:30.0

class ByReferencePerson {
    var weight: Double
    var height: Double

    init(weight: Double, height: Double) {
        self.height = height
        self.weight = weight
    }

    func printValue(name: String) {
        print("\(name) 重:\(weight) 高:\(height)")
    }
}

let samePerson1 = ByReferencePerson(weight: 100, height: 100)
let samePerson2 = samePerson1
samePerson2.height = 30
samePerson1.printValue(name: "one") // one 重:100.0 高:30.0
samePerson2.printValue(name: "two") // two 重:100.0 高:30.0

class ByReferenceCopyPerson: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return ByReferenceCopyPerson(weight: self.weight, height: self.height)
    }

    var weight: Double
    var height: Double

    init(weight: Double, height: Double) {
        self.height = height
        self.weight = weight
    }

    func printValue(name: String) {
        print("\(name) 重:\(weight) 高:\(height)")
    }
}
let sameCopyPerson1 = ByReferenceCopyPerson(weight: 100, height: 100)
let sameCopyPerson2 = sameCopyPerson1.copy() as! ByReferenceCopyPerson
sameCopyPerson2.height = 30
sameCopyPerson1.printValue(name: "one") // one 重:100.0 高:100.0
sameCopyPerson2.printValue(name: "two") // two 重:100.0 高:30.0

class ArrayPerson: NSObject, NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return ArrayPerson(weight: self.weight, height: self.height)
    }
    
    var weight: Double
    var height: Double
    
    init(weight: Double, height: Double) {
        self.height = height
        self.weight = weight
    }
    
    func printValue(name: String) {
        print("\(name) 重:\(weight) 高:\(height)")
    }
}

let arrayPerson1 = [ArrayPerson(weight: 100, height: 100), ArrayPerson(weight: 50, height: 50)]
let arrayPerson2 = arrayPerson1
arrayPerson1[0].height = 30
arrayPerson1[0].printValue(name: "one") // one 重:100.0 高:30.0
arrayPerson2[0].printValue(name: "two") // two 重:100.0 高:30.0

func deepCopy<T>(data: [T]) -> [T] {
    return data.map({ (item) -> T in
        if item is NSObject && item is NSCopying {
            return (item as! NSObject).copy() as! T
        } else {
            return item
        }
    })
}

let arrayCopyPerson1 = [ArrayPerson(weight: 100, height: 100), ArrayPerson(weight: 50, height: 50)]
let arrayCopyPerson2 = deepCopy(data: arrayCopyPerson1)
arrayCopyPerson1[0].height = 30
arrayCopyPerson1[0].printValue(name: "one") // one 重:100.0 高:30.0
arrayCopyPerson2[0].printValue(name: "two") // two 重:100.0 高:100.0
