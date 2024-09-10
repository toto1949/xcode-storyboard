import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var resultFromVC1: UILabel!
    @IBOutlet weak var resultFromVC2: UILabel!
    
    
    let viewController1 = ViewController1()
    let viewController2 = ViewController2()
    
    @IBAction func submitAction(_ sender: Any) {
        guard let num1Text = num1.text, 
              let num2Text = num2.text,
              let number1 = Int(num1Text),
              let number2 = Int(num2Text) else {
            resultFromVC1.text = "Invalid input!"
            resultFromVC2.text = "Invalid input!"
            return
        }
        let additionResult1 = viewController1.add(number1, number2)
        let multiResult1 = viewController1.mult(number1, number2)
        let multiplicationResult1 = "Multiplication: \(multiResult1) \n Additioon : \(additionResult1)"
        resultFromVC1.text = "\(multiplicationResult1)"
        
        
        let additionResult = viewController2.add(number1, number2)
        let multiResult = viewController2.mult(number1, number2)
        let multiplicationResult = "Multiplication: \(multiResult) \n Additioon : \(additionResult)"
        resultFromVC2.text = "\(multiplicationResult)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
