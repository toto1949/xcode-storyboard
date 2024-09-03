//
//  GameViewController.swift
//  AppCounterAndLogin
//
//  Created by Taooufiq El Moutaoouakil on 9/2/24.
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
        }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let usernameText = username.text, !usernameText.isEmpty,
              let passwordText = password.text, !passwordText.isEmpty else {
            print("Missing username or password")
            showAlert(message: "Missing username or password")
            return
        }

        print("Logged in with username: \(usernameText) and password: \(passwordText)")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
