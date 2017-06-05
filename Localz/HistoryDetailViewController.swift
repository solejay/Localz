//
//  HistoryDetailViewController.swift
//  Localz
//
//

import UIKit

class HistoryDetailViewController: UIViewController {
  @IBOutlet weak var confirmationCodeLabel: UILabel!
  
  @IBOutlet weak var activityTitleLabel: UILabel!
  
  @IBOutlet weak var activityValueLable: UILabel!
  
  
  @IBOutlet weak var timeValueLabel: UILabel!
  @IBOutlet weak var dateValueLabel: UILabel!
  
  @IBOutlet weak var pickupDropValLabel: UILabel!
  
  @IBOutlet weak var languageValueLabel: UILabel!
  
  @IBOutlet weak var priceTitleLabel: UILabel!
  @IBOutlet weak var guidePhotoView: UIImageView!

  @IBOutlet weak var priceValueLabel: UILabel!
  @IBOutlet weak var theScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
    }
  func configureView(){
    guidePhotoView.layer.cornerRadius  = guidePhotoView.bounds.width / 2
    guidePhotoView.layer.borderWidth = 2
    guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
    
    let mode = UserDefaults.standard.object(forKey: "mode") as! Int
    if(mode == 1){
      activityTitleLabel.text = "Earnings"
      activityValueLable.text = "$54 @ $16/hr"
      activityValueLable.textColor = UIColor(hex: "#0FD3A7")
      
      priceValueLabel.isHidden = true
      priceTitleLabel.isHidden = true
    }
    
    theScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "HISTORY"
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
