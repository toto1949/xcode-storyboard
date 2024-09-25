import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var countries: [String] = []
    weak var delegate: CountryDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.coutryLabel?.text = countries[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        delegate?.selectCountry(selectedCountry)
        navigationController?.popViewController(animated: true)
    }
}
