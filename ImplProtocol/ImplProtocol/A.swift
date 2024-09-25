import UIKit

class A: UIViewController, PassingData {
    
    override func viewDidLoad() {
           super.viewDidLoad()
        print("Frame size: \(view.frame.size)")

       }
    
    func passData(_ str: String) {
        
    }
    
    func receiveData(_ str: String) {
        dataReceivedBack.text = str
    }
    
    @IBOutlet weak var dataSend: UITextField!
    @IBOutlet weak var dataReceivedBack: UILabel!
    @IBOutlet weak var btnSend: UIButton!
    
    var dataToSend: String?
    
   
    
    @IBAction func btnAction(_ sender: UIButton) {
        print("toto A")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerB = storyboard.instantiateViewController(withIdentifier: "B") as? B {
            viewControllerB.delegate = self
            dataToSend = dataSend.text
            viewControllerB.dataFromA = dataToSend
            navigationController?.pushViewController(viewControllerB, animated: true)
        }
    }
    
    
}

