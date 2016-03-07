//
//  PendingFinishViewController.swift
//  Localz
//
//

import UIKit

class PendingFinishViewController: UIViewController {
   @IBOutlet weak var finishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.configureView()
    }
    func configureView(){
      finishButton.addTarget(self, action: "finishButtonPressed", forControlEvents: .TouchUpInside)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }

  func finishButtonPressed(){
    
    self.navigationController?.popToRootViewControllerAnimated(true)
  }

}
