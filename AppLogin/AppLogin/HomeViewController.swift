//
//  HomeViewController.swift
//  AppLogin
//
//  Created by Taooufiq El moutaoouakil on 9/25/24.
//

import UIKit

class HomeViewController : UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var emaillabel: UILabel!
    
    @IBOutlet weak var passwordlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    func setUpData(){
        emaillabel.text = defaults.string(forKey: "email")
        passwordlabel.text = defaults.string(forKey: "password")
    }
}
