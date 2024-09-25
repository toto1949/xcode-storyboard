import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = APIModelView()

    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()
        callAPI()
    }
    func callAPI() {
         viewModel.fetchDataFromServer { [weak self] data in
             DispatchQueue.main.async {
                 if let data = data {
                     self?.viewModel.model = data
                     self?.collectionView.reloadData()
                 } else {
                     print("Failed to fetch data")
                 }
             }
         }
     }

}
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return viewModel.model.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section  = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
        section.backgroundColor = .placeholderText
        let item = viewModel.model[indexPath.item]
        section.userIdValue.text = "\(item.userId)"
        section.idValue.text = "\(item.id)"
        section.titleValue.text = item.title
        section.isCompleted?.text = item.completed ? "Yes" : "No"
        return section
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: width - 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
