import UIKit

class B: UIViewController {

    @IBOutlet weak var dataReceivedFromA: UILabel!
    @IBOutlet weak var dataSendBack: UITextField!
    
    var delegate: PassingData?
    var dataFromA: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataReceivedFromA.text = dataFromA
    }
    
    @IBAction func test(_ sender: Any) {
        print("toto B")
        if let data = dataSendBack.text {
            delegate?.receiveData(data)
            navigationController?.popViewController(animated: true)
        }    }
}

extension B: PassingData {
    func passData(_ str: String) {
     
    }
    
    func receiveData(_ str: String) {

    }
}
