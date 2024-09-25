import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var namelibrary: UILabel!
    @IBOutlet weak var locationLibrary: UILabel!
    
    let libraryViewModel = LibraryViewModel()
    var expandedSections: Set<Int> = []

    let expandedCellHeight: CGFloat = 200
    let collapsedCellHeight: CGFloat = 44

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview?.dataSource = self
        tableview?.delegate = self
        
        libraryViewModel.fetchLibraryData()
        
        if let library = libraryViewModel.libraryData {
            namelibrary?.text = library.name
            locationLibrary?.text = library.location
            tableview?.reloadData()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return libraryViewModel.libraryData?.books.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedSections.contains(section) ? 1 : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as! LibraryCell
        if let book = libraryViewModel.libraryData?.books[indexPath.section] {
            cell.bookTitle?.text = book.title
            cell.pubyear?.text = String(book.publication_year)
            cell.authorname?.text = book.author.name
            cell.authorbithyear?.text = String(book.author.birth_year)
            cell.authornatio?.text = book.author.nationality
        }
        cell.contentView.layer.borderWidth = 0.8
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.cornerRadius = 8.0
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.text = libraryViewModel.libraryData?.books[section].title
        headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        headerView.contentView.backgroundColor = UIColor.lightGray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleHeaderTap(_:)))
        headerView.addGestureRecognizer(tapGesture)
        headerView.tag = section
        return headerView
    }

    @objc func handleHeaderTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let section = gestureRecognizer.view?.tag else { return }
        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            expandedSections.insert(section)
        }
        tableview.reloadSections([section], with: .automatic)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return expandedSections.contains(indexPath.section) ? expandedCellHeight : collapsedCellHeight
    }

}
