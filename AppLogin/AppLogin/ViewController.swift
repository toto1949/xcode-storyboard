//
//  ViewController.swift
//  AppLogin
//
//  Created by Taooufiq El moutaoouakil on 9/25/24.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: UIButton) {
        print("test")
        defaults.setValue(email.text, forKey: "email")
        defaults.setValue(password.text, forKey: "password")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

