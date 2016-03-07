//
//  BookingCompletedViewController.swift
//  Localz
//
//

import UIKit

class BookingCompletedViewController: UIViewController {

  @IBOutlet weak var guidePhotoView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
    func configureView(){
      if(self.view.bounds.size.height == 480){
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 400, right: 0)
      }
      else if(self.view.bounds.size.height == 568){
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 300, right: 0)
      }
      guidePhotoView.layer.cornerRadius  = CGRectGetWidth(guidePhotoView.bounds) / 2
      guidePhotoView.layer.borderWidth = 2
      guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
