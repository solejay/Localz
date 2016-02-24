//
//  ViewController.swift
//  Localz
//


import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var joinButton: UIButton!
  
  @IBOutlet weak var localzLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    UIApplication.sharedApplication().statusBarHidden = true
  }
  
  func configureView(){
    
  
    loginButton.layer.cornerRadius = 5
    loginButton.addTarget(self, action: "loginButtonPressed", forControlEvents: .TouchUpInside)
    joinButton.layer.cornerRadius = 5
    joinButton.addTarget(self, action: "loginButtonPressed", forControlEvents: .TouchUpInside)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  


}

extension ViewController{
  
  func loginButtonPressed(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("signIn") as! SignInViewController
    self.presentViewController(controller, animated:true , completion: nil)
  }
}

