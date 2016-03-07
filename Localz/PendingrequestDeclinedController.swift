//
//  PendingrequestDeclinedController.swift
//  Localz
//
//

import UIKit

class PendingrequestDeclinedController: UIViewController,UITextFieldDelegate {
   @IBOutlet weak var sendButton: UIButton!
  
  @IBOutlet weak var theTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }
  func configureView(){
    sendButton.addTarget(self, action: "sendButtonPressed", forControlEvents: .TouchUpInside)
    
    let layer = CALayer()
    layer.frame = CGRectMake(0, CGRectGetHeight(theTextField.bounds) - 1, CGRectGetWidth(theTextField.bounds), 0.5)
    layer.backgroundColor = UIColor.blackColor().CGColor
    theTextField.layer.addSublayer(layer)
    theTextField.delegate = self
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()  
    return true
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func sendButtonPressed(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("pendingFinish") as! PendingFinishViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
