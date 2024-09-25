import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var label: UILabel!
    var receivedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = receivedData
    }
}
