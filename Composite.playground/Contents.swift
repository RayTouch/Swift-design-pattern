import UIKit

protocol Component {
    
    var parent: Component? { get set }
    
    func add(component: Component)
    func remove(component: Component)
    
    func isComposite() -> Bool
    
    func operation() -> String
}
extension Component {
    func add(component: Component) {}
    func remove(component: Component) {}
    
    func isComposite() -> Bool {
        return false
    }
}
class Leaf: Component {
    var parent: Component?
    func operation() -> String {
        return "Leaf"
    }
}

class Composite: Component {
    var parent: Component?
    
    private var children: [Component] = []
    
    func add(component: Component) {
        var item = component
        item.parent = self
        children.append(item)
    }
    
    func remove(component: Component) {
        // ...
    }
    func isComposite() -> Bool {
        return true
    }
    func operation() -> String {
        let result = children.map({ $0.operation() })
        return "Branch(" + result.joined(separator: " ") + ")"
    }
}

class Client {
    
    static func someClientCode(component: Component) {
        print("Result: " + component.operation())
    }
    
    static func moreComplexClientCode(leftComponent: Component, rightComponent: Component) {
        if leftComponent.isComposite() {
            leftComponent.add(component: rightComponent)
        }
        print("Result: " + leftComponent.operation())
    }
}

Client.someClientCode(component: Leaf())

/// ...as well as the complex composites.
let tree = Composite()

let branch1 = Composite()
branch1.add(component: Leaf())
branch1.add(component: Leaf())

let branch2 = Composite()
branch2.add(component: Leaf())
branch2.add(component: Leaf())

tree.add(component: branch1)
tree.add(component: branch2)

Client.someClientCode(component: tree)

Client.moreComplexClientCode(leftComponent: tree, rightComponent: Leaf())
