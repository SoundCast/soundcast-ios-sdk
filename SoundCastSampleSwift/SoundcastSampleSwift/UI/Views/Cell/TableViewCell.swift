
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var _lblContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _lblContent.layer.cornerRadius = 3
        _lblContent.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setContent(content: String, bg_color: UIColor) {
        _lblContent.text = content
        _lblContent.backgroundColor = bg_color
    }

}
