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
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }
  func configureView(){
    sendButton.addTarget(self, action: #selector(PendingrequestDeclinedController.sendButtonPressed), for: .touchUpInside)
    
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: theTextField.bounds.height - 1, width: theTextField.bounds.width, height: 0.5)
    layer.backgroundColor = UIColor.black.cgColor
    theTextField.layer.addSublayer(layer)
    theTextField.delegate = self
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()  
    return true
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func sendButtonPressed(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "pendingFinish") as! PendingFinishViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
