//
//  LocationViewController.swift
//  Localz
//
//

import UIKit

class LocationViewController: UIViewController,UITextFieldDelegate{

  @IBOutlet weak var locationTextField: UITextField!
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
      
      locationTextField.delegate = self
      let locationLayer = CALayer()
      locationLayer.frame = CGRectMake(0, CGRectGetHeight(locationTextField.bounds) - 1, CGRectGetWidth(locationTextField.bounds), 0.5)
      locationLayer.backgroundColor = UIColor.darkGrayColor().CGColor
      locationTextField.layer.addSublayer(locationLayer)

    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "ADD NEW LOCATION"
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
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
    

   
}
