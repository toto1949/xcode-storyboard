//
//  GameViewController.swift
//  AppCounterAndLogin
//
//  Created by Taooufiq El moutaoouakil on 9/2/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional setup if needed
    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let usernameText = username.text, !usernameText.isEmpty,
              let passwordText = password.text, !passwordText.isEmpty else {
            print("Missing username or password")
            return
        }
        
        print("Logged in with username: \(usernameText) and password: \(passwordText)")
    }
    @IBAction func counterAction(_ sender: Any) {
    }
    
    @IBAction func increment(_ sender: Any) {
    }
    @IBAction func decremeent(_ sender: Any) {
    }
    
    
}
