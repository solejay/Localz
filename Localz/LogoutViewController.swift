//
//  LogoutViewController.swift
//  Localz
//
//

import UIKit

class LogoutViewController: UIViewController {

  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

      configureView()
    }
  func configureView(){
    yesButton.addTarget(self, action: "yesButtonPressed", forControlEvents: .TouchUpInside)
    noButton.addTarget(self, action: "noButtonPressed", forControlEvents: .TouchUpInside)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func noButtonPressed(){
    self.dismissViewControllerAnimated(false, completion: nil)
  }
  func yesButtonPressed(){
    let rootController = self.storyboard?.instantiateViewControllerWithIdentifier("viewController") as! ViewController
    self.view.window?.rootViewController = rootController
  }
}
