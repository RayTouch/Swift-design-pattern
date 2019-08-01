import UIKit

class SingletonRegister {
    private var dictionary:[String: Any] = [:]
    
    private static let instance = SingletonRegister()
    
    private init() {}
    
    static func save(key: String, value: Any) {
        instance.dictionary[key] = value
    }
    
    static func get(by key: String) -> Any? {
        return instance.dictionary[key]
    }
}

let key = "one"

let first = SingletonRegister.get(by: key)
SingletonRegister.save(key: key, value: 5)
let second = SingletonRegister.get(by: key)

