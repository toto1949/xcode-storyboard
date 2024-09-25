import UIKit

class CategorieCell: UICollectionViewCell {
    @IBOutlet weak var imageProf: UIImageView!
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
         super.awakeFromNib()
         
         self.layer.borderColor = UIColor.gray.cgColor
         self.layer.borderWidth = 0.7
         self.layer.cornerRadius = 8.0
     }
     
     func configure(with data: CellData) {
         imageProf.image = data.image
         label1.text = data.title
     }
}
