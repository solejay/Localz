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
      acceptButton.addTarget(self, action: #selector(PendingRequestDetailController.acceptButtonPressed), for: .touchUpInside)
      declineButton.addTarget(self, action: #selector(PendingRequestDetailController.declinedButtonPressed), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.title = "PENDING REQUESTS"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func acceptButtonPressed(){
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "pendingAccepted") as! PendingRequestAcceptedController
          self.navigationItem.title = ""
          self.navigationController?.pushViewController(controller, animated: true)
  }
  func declinedButtonPressed(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "pendingDeclined") as! PendingrequestDeclinedController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

  
}
