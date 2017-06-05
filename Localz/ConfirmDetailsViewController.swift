//
//  ConfirmDetailsViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating
class ConfirmDetailsViewController: UIViewController {

  @IBOutlet weak var guidePhotoView: UIImageView!
  @IBOutlet weak var completeButton: UIButton!
  @IBOutlet weak var ratingView: EDStarRating!
  var cancelActivityView:CancelActivitiesView!
    override func viewDidLoad() {
        super.viewDidLoad()

      configureView()
    }
  func configureView(){
    let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
    closeButton.setImage(UIImage(named: "closeButton"), for: UIControlState())
    closeButton.tintColor = UIColor.white
    closeButton.addTarget(self, action: #selector(ConfirmDetailsViewController.closeButtonTapped), for: .touchUpInside)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
    cancelActivityView = Bundle.main.loadNibNamed("CancelActivitiesView", owner: nil, options: nil)?.first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.isHidden = true
    cancelActivityView.takeBackButton.addTarget(self, action: #selector(ConfirmDetailsViewController.takeBackButtonPressed), for: .touchUpInside)
    cancelActivityView.dontCancelButton.addTarget(self, action: #selector(ConfirmDetailsViewController.dontCancelButtonPressed), for: .touchUpInside)
    self.view.addSubview(cancelActivityView)
    
    completeButton.addTarget(self, action: #selector(ConfirmDetailsViewController.completeButtonPressed), for: .touchUpInside)
    ratingView.rating = 3.5
    ratingView.starImage = UIImage(named:"star.png")
    ratingView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
    ratingView.maxRating = 5
    // ratingsView1.delegate = self;
    ratingView.horizontalMargin = 0;
    ratingView.editable = false;
    ratingView.displayMode = UInt(EDStarRatingDisplayHalf)
    
    guidePhotoView.layer.cornerRadius  = guidePhotoView.bounds.width / 2
    guidePhotoView.layer.borderWidth = 2
    guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "CONFIRM DETAILS"
  }
  func closeButtonTapped(){
    cancelActivityView.isHidden = false
    self.navigationController?.isNavigationBarHidden = true
    UIApplication.shared.isStatusBarHidden = true
    
  }
  func takeBackButtonPressed(){
    cancelActivityView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
    self.navigationController?.popToRootViewController(animated: true)
  }
  func dontCancelButtonPressed(){
    cancelActivityView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
  }
  func completeButtonPressed(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "bookingCompleted") as! BookingCompletedViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
