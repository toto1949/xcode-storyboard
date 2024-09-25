import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let today: Weekday = .tuesday
    let viewModel = APIModelView()
    
    var mixedData: [MixedDataType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        printWeekDays()
        callAPI()
    }
    
    func callAPI() {
        viewModel.fetchDataFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.prepareMixedData()
                self?.tableView.reloadData()
            }
        }
    }
    
    // Prepare an array that includes both batters and movie details
    func prepareMixedData() {
        mixedData.removeAll() // Clear previous data if any
        
        // Assuming viewModel.model contains the `DataModel` data
        if let model = viewModel.model {
            // Add movie-like data
            mixedData.append(.movie(model))
            
            // Add batter data
            for batter in model.batters.batter {
                mixedData.append(.batter(batter))
            }
        }
    }
    
    func printWeekDays() {
        switch today {
        case .friday:
            print("Friday")
        case .tuesday:
            print("Tuesday")
        case .wednesday:
            print("Wednesday")
        case .thursday:
            print("Thursday")
        case .monday:
            print("Monday")
        case .sunday, .saturday:
            print("It's the weekend")
        }
    }
}

enum MixedDataType {
    case batter(Batter)
    case movie(DataModel)
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100
      }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mixedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = mixedData[indexPath.row]
        
        switch data {
        case .batter(let batter):
            let cell = tableView.dequeueReusableCell(withIdentifier: "BatterCell", for: indexPath) as! BatterCell
            cell.backgroundColor = .placeholderText
            cell.idBattar.text = batter.id
            cell.typeBatar.text = batter.type
            return cell
            
        case .movie(let movie):
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.backgroundColor = .placeholderText
            cell.idMovie.text = movie.id
            cell.nameMovie.text = movie.name
            return cell
        }
    }
}

