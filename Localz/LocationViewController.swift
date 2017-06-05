//
//  LocationViewController.swift
//  Localz
//
//

import UIKit

class LocationViewController: UIViewController,UITextFieldDelegate{

  @IBOutlet weak var locationTextField: UITextField!
  var cancelActivityView:CancelActivitiesView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    func configureView(){
      
      let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
      closeButton.setImage(UIImage(named: "closeButton"), for: UIControlState())
      closeButton.tintColor = UIColor.white
      closeButton.addTarget(self, action: #selector(LocationViewController.closeButtonTapped), for: .touchUpInside)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
      
      cancelActivityView = Bundle.main.loadNibNamed("CancelActivitiesView", owner: nil, options: nil)?.first as! CancelActivitiesView
      cancelActivityView.frame = self.view.bounds
      cancelActivityView.cancelDetailsHeight.constant = 0
      cancelActivityView.isHidden = true
      cancelActivityView.takeBackButton.addTarget(self, action: #selector(LocationViewController.takeBackButtonPressed), for: .touchUpInside)
      cancelActivityView.dontCancelButton.addTarget(self, action: #selector(LocationViewController.dontCancelButtonPressed), for: .touchUpInside)
      self.view.addSubview(cancelActivityView)
      
      locationTextField.delegate = self
      let locationLayer = CALayer()
      locationLayer.frame = CGRect(x: 0, y: locationTextField.bounds.height - 1, width: locationTextField.bounds.width, height: 0.5)
      locationLayer.backgroundColor = UIColor.darkGray.cgColor
      locationTextField.layer.addSublayer(locationLayer)

    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "ADD NEW LOCATION"
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  func closeButtonTapped(){
    cancelActivityView.isHidden = false
    self.navigationController?.isNavigationBarHidden = true
    UIApplication.shared.isStatusBarHidden = true
    
  }
  func takeBackButtonPressed(){
    cancelActivityView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
    self.navigationController?.popToRootViewController(animated: true)
  }
  func dontCancelButtonPressed(){
    cancelActivityView.isHidden = true
    self.navigationController?.isNavigationBarHidden = false
    UIApplication.shared.isStatusBarHidden = false
  }
    

   
}
