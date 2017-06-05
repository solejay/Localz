//
//  BookGuideViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating
class BookGuideViewController: UIViewController {
  
  @IBOutlet weak var guidePhotoView: UIImageView!
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
      let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
      closeButton.setImage(UIImage(named: "closeButton"), for: UIControlState())
      closeButton.tintColor = UIColor.white
      closeButton.addTarget(self, action: #selector(BookGuideViewController.closeButtonTapped), for: .touchUpInside)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
      let tap1 = UITapGestureRecognizer(target: self, action: #selector(BookGuideViewController.tourSelected(_:)))
      let tap2 = UITapGestureRecognizer(target: self, action: #selector(BookGuideViewController.tourSelected(_:)))
      let tap3 = UITapGestureRecognizer(target: self, action: #selector(BookGuideViewController.tourSelected(_:)))
      mueumOvelay.tag = 1
      mueumOvelay.addGestureRecognizer(tap1)
      outDoorsOverlay.tag = 2
      outDoorsOverlay.addGestureRecognizer(tap2)
      nighlifeOverlay.tag = 3
      nighlifeOverlay.addGestureRecognizer(tap3)
    
    cancelActivityView = Bundle.main.loadNibNamed("CancelActivitiesView", owner: nil, options: nil)?.first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.isHidden = true
    cancelActivityView.takeBackButton.addTarget(self, action: #selector(BookGuideViewController.takeBackButtonPressed), for: .touchUpInside)
     cancelActivityView.dontCancelButton.addTarget(self, action: #selector(BookGuideViewController.dontCancelButtonPressed), for: .touchUpInside)
    self.view.addSubview(cancelActivityView)
    
    ratingsView.rating = 3.5
    ratingsView.starImage = UIImage(named:"star.png")
    ratingsView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
    ratingsView.maxRating = 5
    // ratingsView1.delegate = self;
    ratingsView.horizontalMargin = 0;
    ratingsView.editable = false;
    ratingsView.displayMode = UInt(EDStarRatingDisplayHalf)
    
    guidePhotoView.layer.cornerRadius  = guidePhotoView.bounds.width / 2
    guidePhotoView.layer.borderWidth = 2
    guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor

  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func tourSelected(_ gesture : UITapGestureRecognizer){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "bookActivityDetails") as! BookActivityDetailsController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: false)
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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "BOOK YOUR GUIDE"
  }
}
