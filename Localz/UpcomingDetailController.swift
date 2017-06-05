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

        theScrollView.contentInset = UIEdgeInsets(top: (self.navigationController?.navigationBar.frame)!.height + 20, left: 0, bottom: 120, right: 0)
      
      cancelActivityView = Bundle.main.loadNibNamed("CancelActivitiesView", owner: nil, options: nil)?.first as! CancelActivitiesView  
      cancelActivityView.frame = self.view.bounds
      cancelActivityView.isHidden = true
      cancelActivityView.takeBackButton.addTarget(self, action: #selector(UpcomingDetailController.takeBackButtonPressed), for: .touchUpInside)
       cancelActivityView.dontCancelButton.addTarget(self, action: #selector(UpcomingDetailController.dontCancelButtonPressed), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(UpcomingDetailController.cancelButtonTapped), for: .touchUpInside)
      self.view.addSubview(cancelActivityView)
      
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.title = "UPCOMING ACTIVITIES"
    }
  
  
  
   

}

extension UpcomingDetailController{
  func  cancelButtonTapped(){
    cancelActivityView.isHidden  = false
    self.navigationController?.isNavigationBarHidden = true
    UIApplication.shared.isStatusBarHidden = true
  }
  func takeBackButtonPressed(){
    cancelActivityView.isHidden  = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
    self.navigationController?.popToRootViewController(animated: true)
  }
  func dontCancelButtonPressed(){
    cancelActivityView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
  }
}
