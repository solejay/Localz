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
    let closeButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
    closeButton.setImage(UIImage(named: "closeButton"), forState: .Normal)
    closeButton.tintColor = UIColor.whiteColor()
    closeButton.addTarget(self, action: "closeButtonTapped", forControlEvents: .TouchUpInside)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
    cancelActivityView = NSBundle.mainBundle().loadNibNamed("CancelActivitiesView", owner: nil, options: nil).first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.hidden = true
    cancelActivityView.takeBackButton.addTarget(self, action: "takeBackButtonPressed", forControlEvents: .TouchUpInside)
    cancelActivityView.dontCancelButton.addTarget(self, action: "dontCancelButtonPressed", forControlEvents: .TouchUpInside)
    self.view.addSubview(cancelActivityView)
    
    completeButton.addTarget(self, action: "completeButtonPressed", forControlEvents: .TouchUpInside)
    ratingView.rating = 3.5
    ratingView.starImage = UIImage(named:"star.png")
    ratingView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
    ratingView.maxRating = 5
    // ratingsView1.delegate = self;
    ratingView.horizontalMargin = 0;
    ratingView.editable = false;
    ratingView.displayMode = UInt(EDStarRatingDisplayHalf)
    
    guidePhotoView.layer.cornerRadius  = CGRectGetWidth(guidePhotoView.bounds) / 2
    guidePhotoView.layer.borderWidth = 2
    guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "CONFIRM DETAILS"
  }
  func closeButtonTapped(){
    cancelActivityView.hidden = false
    self.navigationController?.navigationBarHidden = true
    UIApplication.sharedApplication().statusBarHidden = true
    
  }
  func takeBackButtonPressed(){
    cancelActivityView.hidden = true
    self.navigationController?.navigationBarHidden = false
    UIApplication.sharedApplication().statusBarHidden = false
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  func dontCancelButtonPressed(){
    cancelActivityView.hidden = true
    self.navigationController?.navigationBarHidden = false
    UIApplication.sharedApplication().statusBarHidden = false
  }
  func completeButtonPressed(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("bookingCompleted") as! BookingCompletedViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
