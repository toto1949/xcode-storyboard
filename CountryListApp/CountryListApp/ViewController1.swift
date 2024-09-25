import UIKit

class ViewController1: UIViewController, CountryDelegate {

    @IBOutlet weak var selectedCountryLabel: UILabel!
    
    @IBAction func showCountriesButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToVC2", sender: self)
    }

    let countries = ["USA", "Canada", "Mexico", "France", "Germany", "Italy"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVC2", let destinationVC = segue.destination as? ViewController2 {
            destinationVC.countries = countries
            destinationVC.delegate = self
        }
    }

    func selectCountry(_ country: String) {
        selectedCountryLabel.text = country
    }
}
