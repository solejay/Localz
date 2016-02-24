//
//  GuideViewCell.swift
//  Localz
//
//

import UIKit
import EDStarRating

class GuideViewCell: UITableViewCell {

  @IBOutlet weak var localzBackgroundView: UIImageView!
  
  @IBOutlet weak var tourTypesLabel: UILabel!
  @IBOutlet weak var reviewLabel: UILabel!
  @IBOutlet weak var ratingsView: EDStarRating!
  @IBOutlet weak var guidePhotoView: UIImageView!
  @IBOutlet weak var guideCoverView: UIImageView!
  @IBOutlet weak var guideNameLabel: UILabel!

  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var timeAgoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
