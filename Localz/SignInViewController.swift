//
//  SignInViewController.swift
//  Localz
//
//

import UIKit

class SignInViewController: UIViewController,UITextFieldDelegate{

  @IBOutlet weak var usernameTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var joinButton: UIButton!
  @IBOutlet weak var facebookButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
      
      
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    UIApplication.sharedApplication().statusBarHidden = false
    UIApplication.sharedApplication().statusBarStyle = .LightContent

  }
  
  func configureView(){
    
    
    let username = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor().colorWithAlphaComponent(0.7)])
    usernameTextField.attributedPlaceholder = username
    let layer = CALayer()
    layer.frame = CGRectMake(0, CGRectGetHeight(usernameTextField.bounds) - 1, CGRectGetWidth(usernameTextField.bounds), 0.5)
    layer.backgroundColor = UIColor.whiteColor().CGColor
    usernameTextField.layer.addSublayer(layer)
    usernameTextField.delegate = self
  
    let password = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor().colorWithAlphaComponent(0.7)])
    passwordTextField.attributedPlaceholder = password
    passwordTextField.delegate = self
    let passwordlayer = CALayer()
    passwordlayer.frame = CGRectMake(0, CGRectGetHeight(passwordTextField.bounds) - 1, CGRectGetWidth(passwordTextField.bounds), 0.5)
    passwordlayer.backgroundColor = UIColor.whiteColor().CGColor
    passwordTextField.layer.addSublayer(passwordlayer)
    
    joinButton.layer.cornerRadius = 5
    joinButton.addTarget(self, action: "joinButtonPressed", forControlEvents: .TouchUpInside)
    facebookButton.layer.cornerRadius = 5


    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()  
    return true
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension SignInViewController{
  func joinButtonPressed(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("chooseMode") as! ChooseModeViewController
    self.presentViewController(controller, animated: false, completion: nil)
  }
}


