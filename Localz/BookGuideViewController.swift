//
//  BookGuideViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating
class BookGuideViewController: UIViewController {
  
  @IBOutlet weak var ratingsView: EDStarRating!
  @IBOutlet weak var nighlifeOverlay: UIView!
  @IBOutlet weak var outDoorsOverlay: UIView!
  @IBOutlet weak var mueumOvelay: UIView!
  var cancelActivityView:CancelActivitiesView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.configureView()
        // Do any additional setup after loading the view.
    }
  func configureView(){
      let closeButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
      closeButton.setImage(UIImage(named: "closeButton"), forState: .Normal)
      closeButton.tintColor = UIColor.whiteColor()
      closeButton.addTarget(self, action: "closeButtonTapped", forControlEvents: .TouchUpInside)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
      let tap1 = UITapGestureRecognizer(target: self, action: "tourSelected:")
      let tap2 = UITapGestureRecognizer(target: self, action: "tourSelected:")
      let tap3 = UITapGestureRecognizer(target: self, action: "tourSelected:")
      mueumOvelay.tag = 1
      mueumOvelay.addGestureRecognizer(tap1)
      outDoorsOverlay.tag = 2
      outDoorsOverlay.addGestureRecognizer(tap2)
      nighlifeOverlay.tag = 3
      nighlifeOverlay.addGestureRecognizer(tap3)
    
    cancelActivityView = NSBundle.mainBundle().loadNibNamed("CancelActivitiesView", owner: nil, options: nil).first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.hidden = true
    cancelActivityView.takeBackButton.addTarget(self, action: "takeBackButtonPressed", forControlEvents: .TouchUpInside)
     cancelActivityView.dontCancelButton.addTarget(self, action: "dontCancelButtonPressed", forControlEvents: .TouchUpInside)
    self.view.addSubview(cancelActivityView)
    
    ratingsView.rating = 3.5
    ratingsView.starImage = UIImage(named:"star.png")
    ratingsView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
    ratingsView.maxRating = 5
    // ratingsView1.delegate = self;
    ratingsView.horizontalMargin = 0;
    ratingsView.editable = false;
    ratingsView.displayMode = UInt(EDStarRatingDisplayHalf)

  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func tourSelected(gesture : UITapGestureRecognizer){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("bookActivityDetails") as! BookActivityDetailsController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: false)
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

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "BOOK YOUR GUIDE"
  }
}
