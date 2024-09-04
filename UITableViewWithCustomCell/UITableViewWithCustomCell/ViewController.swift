import UIKit

class ViewController:  UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var launchItems: [LaunchItem] = [
        LaunchItem(name: "Lunch 1", description: "description 1", launchTime: "2024-09-04 14:30", status: .success),
        LaunchItem(name: "Lunch 2", description: "description 2", launchTime: "2024-08-15 09:00", status: .failure),
        LaunchItem(name: "Lunch 3", description: "description 3", launchTime: "2024-07-22 16:33", status: .success),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            fatalError("Unable to dequeue CustomCell")
        }
        
        let launchItem = launchItems[indexPath.row]
        cell.labelTitle.text = launchItem.name
        cell.labelDescription.text = "\(launchItem.description) at \(launchItem.launchTime). Status is \(launchItem.status)"

        cell.imageprofile.image = launchItem.status == .success ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "xmark.circle")
        
        return cell
    }
}
