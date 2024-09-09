import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var numberLabel1: UILabel!
    var number: Int?
    var backgroundColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let number = number {
            numberLabel1.text = "\(number)"
        }
        
        if let color = backgroundColor {
            view.backgroundColor = color
        }
    }
}
