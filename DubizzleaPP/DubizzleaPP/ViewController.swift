//
//  ViewController.swift
//  DubizzleaPP
//
//  Created by Taooufiq El moutaoouakil on 9/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    @IBOutlet weak var emailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            googleButton.layer.borderWidth = 1
            googleButton.layer.borderColor = UIColor.black.cgColor
            
            googleButton.layer.cornerRadius = 10
            
            
            facebookButton.layer.borderWidth = 1
            facebookButton.layer.borderColor = UIColor.black.cgColor
        facebookButton.layer.cornerRadius = 10

            appleButton.layer.borderWidth = 1
            appleButton.layer.borderColor = UIColor.black.cgColor
        
        appleButton.layer.cornerRadius = 10

        
        
        emailButton.layer.borderWidth = 1
        emailButton.layer.borderColor = UIColor.black.cgColor
        emailButton.layer.cornerRadius = 10

    

      
    }


}

