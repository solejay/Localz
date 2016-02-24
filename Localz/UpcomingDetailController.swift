//
//  UpcomingDetailController.swift
//  Localz
//
//

import UIKit

class UpcomingDetailController: UIViewController {

  @IBOutlet weak var sendMessageButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var theScrollView: UIScrollView!
  var cancelActivityView: CancelActivitiesView!
    override func viewDidLoad() {
        super.viewDidLoad()

        theScrollView.contentInset = UIEdgeInsets(top: CGRectGetHeight((self.navigationController?.navigationBar.frame)!) + 20, left: 0, bottom: 120, right: 0)
      
      cancelActivityView = NSBundle.mainBundle().loadNibNamed("CancelActivitiesView", owner: nil, options: nil).first as! CancelActivitiesView  
      cancelActivityView.frame = self.view.bounds
      cancelActivityView.hidden = true
      cancelActivityView.takeBackButton.addTarget(self, action: "takeBackButtonPressed", forControlEvents: .TouchUpInside)
       cancelActivityView.dontCancelButton.addTarget(self, action: "dontCancelButtonPressed", forControlEvents: .TouchUpInside)
      cancelButton.addTarget(self, action: "cancelButtonTapped", forControlEvents: .TouchUpInside)
      self.view.addSubview(cancelActivityView)
      
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
      super.viewWillAppear(animated)
      self.title = "UPCOMING ACTIVITIES"
    }
  
  
  
   

}

extension UpcomingDetailController{
  func  cancelButtonTapped(){
    cancelActivityView.hidden  = false
    self.navigationController?.navigationBarHidden = true
    UIApplication.sharedApplication().statusBarHidden = true
  }
  func takeBackButtonPressed(){
    cancelActivityView.hidden  = true
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
