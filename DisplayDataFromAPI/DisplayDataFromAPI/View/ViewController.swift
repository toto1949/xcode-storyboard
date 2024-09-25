//
//  ViewController.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var viewModel = MyViewModel()
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 200

        super.viewDidLoad()
        callAPI()
    }

    func callAPI() {
//        viewModel.fetchDataFromServer { data in
//            DispatchQueue.main.async {
//                if let data = data {
//                    print("\(data)")
//                } else {
//                    print("Failed to fetch data")
//                }
//            }
//        }
    }
}
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let data  = viewModel.model
        cell.birthYearLabel.text = data?.birthYear
        cell.eyeColorLabel.text = data?.eyeColor
        cell.massLabel.text = data?.mass
        cell.skinColorLabel.text = data?.skinColor
        cell.genderLabel.text = data?.gender
        cell.heightLabel.text = data?.height
        cell.nameLabel.text = data?.name
        cell.hairColorLabel.text = data?.hairColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

