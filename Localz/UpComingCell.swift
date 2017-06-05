//
//  UpComingCell.swift
//  Localz
//
//

import UIKit

class UpComingCell: UITableViewCell {

  @IBOutlet weak var guideNameLabel: UILabel!
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var tourType: UILabel!
  
  @IBOutlet weak var guidePhotoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
