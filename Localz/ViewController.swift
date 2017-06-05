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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIApplication.shared.isStatusBarHidden = true
  }
  
  func configureView(){
    
  
    loginButton.layer.cornerRadius = 5
    loginButton.addTarget(self, action: #selector(ViewController.loginButtonPressed), for: .touchUpInside)
    joinButton.layer.cornerRadius = 5
    joinButton.addTarget(self, action: #selector(ViewController.loginButtonPressed), for: .touchUpInside)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  


}

extension ViewController{
  
  func loginButtonPressed(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "signIn") as! SignInViewController
    self.present(controller, animated:true , completion: nil)
  }
}

