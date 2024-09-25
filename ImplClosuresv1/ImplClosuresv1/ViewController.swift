import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func showTextonVC2(_ sender: Any) {
        performSegue(withIdentifier: "showSecondVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondVC" {
            if let destinationVC = segue.destination as? ViewController2 {
                destinationVC.receivedData = textField.text
            }
        }
    }
}
