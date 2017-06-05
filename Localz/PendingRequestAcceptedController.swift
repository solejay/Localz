//
//  PendingRequestAcceptedController.swift
//  Localz
//
//

import UIKit

class PendingRequestAcceptedController: UIViewController {
  @IBOutlet weak var contactExplorerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
