//
//  PendingRequestDetailController.swift
//  Localz
//
//

import UIKit

class PendingRequestDetailController: UIViewController {

  @IBOutlet weak var declineButton: UIButton!
  @IBOutlet weak var acceptButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }
    func configureView(){
      acceptButton.addTarget(self, action: "acceptButtonPressed", forControlEvents: .TouchUpInside)
      declineButton.addTarget(self, action: "declinedButtonPressed", forControlEvents: .TouchUpInside)
    }
    override func viewWillAppear(animated: Bool) {
      super.viewWillAppear(animated)
      self.title = "PENDING REQUESTS"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func acceptButtonPressed(){
      let controller = self.storyboard?.instantiateViewControllerWithIdentifier("pendingAccepted") as! PendingRequestAcceptedController
          self.navigationItem.title = ""
          self.navigationController?.pushViewController(controller, animated: true)
  }
  func declinedButtonPressed(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("pendingDeclined") as! PendingrequestDeclinedController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

  
}
