//
//  ViewController.swift
//  Enums
//
//  Created by Taooufiq El moutaoouakil on 9/17/24.
//

import UIKit

class ViewController: UIViewController {
    let today  :  Weekday = .tuesday
    override func viewDidLoad() {
        super.viewDidLoad()
        printWeekDays()
    }
    func printWeekDays(){
        switch today {
        case .friday:
            print("Fiday")
        case .tuesday:
            print("Tuesday")
        case .wednesday:
            print("Wednesday")
        case .thursday:
            print("Thursday")
        case .monday:
            print("Monday")
        case .sunday, .saturday:
            print("it's a weekend")
        }
    }
}

