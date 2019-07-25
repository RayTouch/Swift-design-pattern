import UIKit

struct ARModel {
    var name: String
    var width: CGFloat
    var height: CGFloat
    var length: CGFloat
    
    func printVlaue() {
        print("name = \(name)")
        print("width = \(width)")
        print("height = \(height)")
        print("length = \(length)")
    }
}

let model_1 = ARModel(name: "1", width: 100, height: 100, length: 100)
model_1.printVlaue()

class ARModelBulider {
    private var name: String = "1"
    private var width: CGFloat = 100
    private var height: CGFloat = 100
    private var length: CGFloat = 100
    
    func setName(_ name: String) { self.name = name }
    func setWidth(_ width: CGFloat) { self.width = width }
    func setHieght(_ height: CGFloat) { self.height = height }
    func setLength(_ length: CGFloat) { self.length = length }
    
    func builderARModel() -> ARModel {
        return ARModel(name: self.name, width: self.width, height: self.height, length: self.length)
    }
}

let builder = ARModelBulider()
builder.setName("3")
let model_2 = builder.builderARModel()
model_2.printVlaue()
