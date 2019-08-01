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
    
    func setName(_ name: String) -> ARModelBulider { self.name = name; return self }
    func setWidth(_ width: CGFloat) -> ARModelBulider { self.width = width; return self }
    func setHieght(_ height: CGFloat) -> ARModelBulider { self.height = height; return self }
    func setLength(_ length: CGFloat) -> ARModelBulider { self.length = length; return self }
    
    func builderARModel() -> ARModel {
        return ARModel(name: self.name, width: self.width, height: self.height, length: self.length)
    }
}

let builder = ARModelBulider().setName("5").setLength(30).builderARModel()
builder.printVlaue()
//builder.setName("3")
//let model_2 = builder.builderARModel()
//model_2.printVlaue()
