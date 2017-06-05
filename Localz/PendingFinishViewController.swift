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
      finishButton.addTarget(self, action: #selector(PendingFinishViewController.finishButtonPressed), for: .touchUpInside)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }

  func finishButtonPressed(){
    
    self.navigationController?.popToRootViewController(animated: true)
  }

}
