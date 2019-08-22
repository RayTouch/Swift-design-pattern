import UIKit

protocol Shape {
    func draw()
    func resize()
}

protocol GeoShape {
    func drawShape()
    func resetSize()
}

class A: Shape {
    
    var number = 1
    
    func resize() {
        print("A resize")
    }
    func draw() {
        print("A draw = \(self.number)")
    }
}
class B: Shape {
    var number = 1
    
    func resize() {
        print("B resize")
    }
    func draw() {
        print("B draw = \(self.number)")
    }
}

class C: GeoShape {
    var number = 1
    func drawShape() {
        print("C draw = \(self.number)")
    }
    
    func resetSize() {
        print("D resize")
    }
}

class D: GeoShape {
    var number = 1
    func drawShape() {
        print("D draw = \(self.number)")
    }
    
    func resetSize() {
        print("D resize")
    }
}
/// Object Adapter
class OA: Shape {
    
    private var shape: GeoShape
    
    init(_ geoShape: GeoShape) {
        self.shape = geoShape
    }
    
    func resize() {
        self.shape.resetSize()
    }
    func draw() {
        self.shape.drawShape()
    }
}
/// Class Adapter
class CA: C, Shape {
    func draw() {
        self.drawShape()
    }
    
    func resize() {
        self.resetSize()
    }
}
class DA: D,Shape {
    func draw() {
        self.drawShape()
    }
    
    func resize() {
        self.resetSize()
    }
}

class AdapterArray {
    private var array: [Shape] = []
    
    func add(_ shape: Shape) {
        self.array.append(shape)
    }
    
    func draw() {
        self.array.forEach({ $0.draw() })
    }
    
    func resize() {
        self.array.forEach({ $0.resize() })
    }
}

let a = A()
let b = B()
let c = C()
let d = D()
let coa = OA(c)
let doa = OA(d)
let ca = CA()
let da = DA()

/// Object Adapter
let array_1 = AdapterArray()
array_1.add(a)
array_1.add(b)
array_1.add(coa)
array_1.add(doa)

c.number = 2
d.number = 4
print(" Object Adapter ")
array_1.draw()
array_1.resize()
/// Class Adapter
let array_2 = AdapterArray()
array_2.add(a)
array_2.add(b)
array_2.add(ca)
array_2.add(da)

ca.number = 2
da.number = 4

print(" Class Adapter ")

array_2.draw()
array_2.resize()
