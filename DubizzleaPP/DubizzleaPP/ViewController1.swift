import UIKit

class ViewController1: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var cellDataArray = [CellData]()
    var filterData = [CellData]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self  
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
        }
        
        populateCellData()
        filterData = cellDataArray
    }

    func populateCellData() {
        if let imageRent = UIImage(named: "ImageRent"),
           let imageSale = UIImage(named: "ImageSale"),
           let imageOffPlen = UIImage(named: "ImageOffPlen"),
           let imageRoom = UIImage(named: "ImageRoom"),
           let imageMotors = UIImage(named: "ImageMotors"),
           let imageJobs = UIImage(named: "ImageJobs"),
           let imageCl = UIImage(named: "ImageCl"),
           let imageF = UIImage(named: "ImageF"),
           let imageCom = UIImage(named: "ImageCom") {
            
            cellDataArray = [
                CellData(title: "Property for Rent", image: imageRent),
                CellData(title: "Property for Sale", image: imageSale),
                CellData(title: "Off-Plan properties", image: imageOffPlen),
                CellData(title: "Rooms for Rent", image: imageRoom),
                CellData(title: "Motors", image: imageMotors),
                CellData(title: "Jobs", image: imageJobs),
                CellData(title: "Classifieds", image: imageCl),
                CellData(title: "Furniture & Garden", image: imageF),
                CellData(title: "Community", image: imageCom)
            ]
        } else {
            print("Error: One or more images not found in assets.")
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCell", for: indexPath) as! CategorieCell
        let data = filterData[indexPath.item] // Use filterData, not cellDataArray
        cell.configure(with: data)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("sizeForItemAt called")
        let width = (collectionView.frame.width - 20) / 3
        return CGSize(width: width, height: width + 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("minimumInteritemSpacingForSectionAt called")
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        print("minimumLineSpacingForSectionAt called")
        return 10
    }
}

extension ViewController1: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = cellDataArray
        } else {
            filterData = cellDataArray.filter { $0.title.localizedCaseInsensitiveContains(searchText) } // Use title, not label1
        }
        collectionView.reloadData()
    }
}
