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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIApplication.shared.isStatusBarHidden = false
    UIApplication.shared.statusBarStyle = .lightContent

  }
  
  func configureView(){
    
    
    let username = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName:UIColor.white.withAlphaComponent(0.7)])
    usernameTextField.attributedPlaceholder = username
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: usernameTextField.bounds.height - 1, width: usernameTextField.bounds.width, height: 0.5)
    layer.backgroundColor = UIColor.white.cgColor
    usernameTextField.layer.addSublayer(layer)
    usernameTextField.delegate = self
  
    let password = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName:UIColor.white.withAlphaComponent(0.7)])
    passwordTextField.attributedPlaceholder = password
    passwordTextField.delegate = self
    let passwordlayer = CALayer()
    passwordlayer.frame = CGRect(x: 0, y: passwordTextField.bounds.height - 1, width: passwordTextField.bounds.width, height: 0.5)
    passwordlayer.backgroundColor = UIColor.white.cgColor
    passwordTextField.layer.addSublayer(passwordlayer)
    
    joinButton.layer.cornerRadius = 5
    joinButton.addTarget(self, action: #selector(SignInViewController.joinButtonPressed), for: .touchUpInside)
    facebookButton.layer.cornerRadius = 5


    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "chooseMode") as! ChooseModeViewController
    self.present(controller, animated: false, completion: nil)
  }
}


