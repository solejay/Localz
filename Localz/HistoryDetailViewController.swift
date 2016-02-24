//
//  HistoryDetailViewController.swift
//  Localz
//
//

import UIKit

class HistoryDetailViewController: UIViewController {
  @IBOutlet weak var guidePhotoView: UIImageView!

  @IBOutlet weak var theScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
    }
  func configureView(){
    guidePhotoView.layer.cornerRadius  = CGRectGetWidth(guidePhotoView.bounds) / 2
    guidePhotoView.layer.borderWidth = 2
    guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor

    theScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "HISTORY"
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
