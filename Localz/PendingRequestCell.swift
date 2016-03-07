//
//  PendingRequestCell.swift
//  Localz
//
//

import UIKit

class PendingRequestCell: UITableViewCell {

  @IBOutlet weak var userPhotoView: UIView!
  
  @IBOutlet weak var userNameLabel: UILabel!
  
  @IBOutlet weak var estimatedLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
