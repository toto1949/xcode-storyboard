protocol PassDataBetweenTwoClasses {
    func passData(_ data: String)
}

class A {
    var delegate: PassDataBetweenTwoClasses?
    
    func sendData(_ data: String) {
        print("Class A is sending data: \(data)")
        self.delegate?.passData(data)
    }
}

class B: PassDataBetweenTwoClasses {
    func passData(_ data: String) {
        print("Class B received data: \(data)")
    }
}

let classA = A()
let classB = B()

classA.delegate = classB

classA.sendData("Hello from Class A!")
