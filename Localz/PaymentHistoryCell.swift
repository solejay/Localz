//
//  PaymentHistoryCell.swift
//  Localz
//
//

import UIKit

class PaymentHistoryCell: UITableViewCell {

  @IBOutlet weak var guideNameLabel: UILabel!
  @IBOutlet weak var dateTimeLabel: UILabel!
  @IBOutlet weak var tourTypesLabel: UILabel!
  @IBOutlet weak var earningsLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
