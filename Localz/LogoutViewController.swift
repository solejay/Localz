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
    yesButton.addTarget(self, action: #selector(LogoutViewController.yesButtonPressed), for: .touchUpInside)
    noButton.addTarget(self, action: #selector(LogoutViewController.noButtonPressed), for: .touchUpInside)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func noButtonPressed(){
    self.dismiss(animated: false, completion: nil)
  }
  func yesButtonPressed(){
    UserDefaults.standard.removeObject(forKey: "mode")
    let rootController = self.storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
    self.view.window?.rootViewController = rootController
  }
}
