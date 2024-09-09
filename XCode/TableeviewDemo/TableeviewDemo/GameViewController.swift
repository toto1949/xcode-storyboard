import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let number = indexPath.row + 1
        
        if number % 2 == 0 && number % 5 == 0 {
            cell.textLabel?.text = "\(number)"
            cell.backgroundColor = .yellow
        } else if number % 2 == 0 {
            cell.textLabel?.text = "\(number)"
            cell.backgroundColor = .green
        } else if number % 5 == 0 {
            cell.textLabel?.text = "\(number)"
            cell.backgroundColor = .red
        } else {
            cell.textLabel?.text = "\(number)"
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = indexPath.row + 1
        let color = tableView.cellForRow(at: indexPath)?.backgroundColor
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.number = number
            detailVC.backgroundColor = color
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
