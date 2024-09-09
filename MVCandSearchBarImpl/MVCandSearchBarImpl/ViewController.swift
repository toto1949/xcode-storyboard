import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var statesData = [CityModel]()
    var filterData = [CityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        tableview.dataSource = self
        tableview.delegate = self
        searchBar.delegate = self
        
        if let path = Bundle.main.path(forResource: "dataSource", ofType: "plist"),
           let dic = NSDictionary(contentsOfFile: path),
           let states = dic.object(forKey: "states") as? [String] {
            statesData = states.map{CityModel(city: $0)}
        }
        
        filterData = statesData
        tableview.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.labell.text = filterData[indexPath.row].city
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = statesData
        } else {
            filterData = statesData.filter { $0.city.contains(searchText) }
        }
        tableview.reloadData()
    }
}
