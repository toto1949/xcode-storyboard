import UIKit

class CustomCell: UITableViewCell {
    
//    @IBOutlet weak var imageprofile: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
//    @IBOutlet weak var labelDescription: UILabel!
    //    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

