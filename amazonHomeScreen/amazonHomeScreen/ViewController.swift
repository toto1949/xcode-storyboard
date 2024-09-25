import UIKit
import Fakery

class ViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var statesData = [Product]()
    var filterData = [Product]()
    
    let faker = Faker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the collection view and search bar delegates and data sources
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        searchBar.delegate = self
        
        generateRandomProducts(count: 10)
        filterData = statesData
    }
    func generateRandomProducts(count: Int) {
        let queries = ["laptop", "smartphone", "headphones", "camera"]
         for _ in 0..<count {
             let randomName = faker.commerce.productName()
             let randomPrice = faker.commerce.price()
             let randomQuery = queries.randomElement() ?? "laptop"
             let randomImageURL = "https://picsum.photos/seed/\(randomQuery)/200/300"
                    
             let product = Product(name: randomName, price: Double(randomPrice), imageName: randomImageURL)
             statesData.append(product)
         }
     }
}

// MARK: - Collection View DataSource and Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterData.count // Use filterData here
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let product = filterData[indexPath.row] // Use filterData here
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = "$\(product.price)"
        if let url = URL(string: product.imageName) {
                 DispatchQueue.global().async {
                     if let data = try? Data(contentsOf: url) {
                         DispatchQueue.main.async {
                             cell.productImageView.image = UIImage(data: data)
                         }
                     }
                 }
             } else {
                 // Fallback image if URL is invalid
                 cell.productImageView.image = UIImage(named: "placeholder")
             }
        
        return cell
    }
}

// MARK: - Collection View Flow Layout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: width + 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterData = statesData
        } else {
            filterData = statesData.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.price.description.localizedCaseInsensitiveContains(searchText)}
        }
        productCollectionView.reloadData()
    }
}
