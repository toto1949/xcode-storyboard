import UIKit

class ViewController1: UIViewController,Operations {

    func add(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
    
    func mult(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
