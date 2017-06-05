//
//  ChooseModeViewController.swift
//  Localz
//
//

import UIKit
import SASlideMenu

class ChooseModeViewController: UIViewController {

  @IBOutlet weak var explorerButton: UIButton!
  
  @IBOutlet weak var guideButton: UIButton!
  var locationOverlay:LocationOverlay!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
  func configureView(){
    explorerButton.layer.cornerRadius = 5
    explorerButton.isSelected = true
    explorerButton.addTarget(self, action: #selector(ChooseModeViewController.explore(_:)), for: .touchUpInside)
    
    guideButton.layer.cornerRadius = 5
    guideButton.isSelected = false
    guideButton.addTarget(self, action: #selector(ChooseModeViewController.guide(_:)), for: .touchUpInside)
    
    buttonStyleForState(explorerButton)
    buttonStyleForState(guideButton)
    
    locationOverlay = Bundle.main.loadNibNamed("LocationOverlay", owner: nil, options: nil)?.first as! LocationOverlay
    locationOverlay.frame = self.view.bounds
    locationOverlay.gotItButton.addTarget(self, action: #selector(ChooseModeViewController.gotItButtonPressed), for: .touchUpInside)
    locationOverlay.isHidden = true
    self.view.addSubview(locationOverlay)
    
    
  }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
  
  func buttonStyleForState(_ button:UIButton){
    if(button.isSelected == true){
      button.backgroundColor = UIColor(hex: "#E13F53")
      button.layer.borderWidth = 0
    }else{
      button.backgroundColor = UIColor.clear
      button.layer.borderWidth = 0.5
      button.layer.borderColor = UIColor.white.cgColor
    }
    
  }
  

}
extension ChooseModeViewController{
  func explore(_ button:UIButton){
    button.isSelected = true
    guideButton.isSelected = false
    buttonStyleForState(button)
    buttonStyleForState(guideButton)
    locationOverlay.isHidden = false
    
  }
  func guide(_ button:UIButton){
    button.isSelected = true
    explorerButton.isSelected = false
    buttonStyleForState(button)
    buttonStyleForState(explorerButton)
    locationOverlay.isHidden = false
  }
  func gotItButtonPressed(){
    let alertController = UIAlertController(title: "\"Localz\" Would Like to Use Your Current Location", message: "", preferredStyle: .alert)
    let cancelAction: UIAlertAction = UIAlertAction(title: "Don't Allow", style: .cancel) { action -> Void in
      //Do some stuff
    }
    alertController.addAction(cancelAction)
    //Create and an option action
    let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
      //Do some other stuff
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "home") as! SASlideMenuRootViewController
      if(self.guideButton.isSelected == true){
        UserDefaults.standard.removeObject(forKey: "mode")
        UserDefaults.standard.set(1, forKey: "mode")
      }else{
        UserDefaults.standard.removeObject(forKey: "mode")
        UserDefaults.standard.set(0, forKey: "mode")
      }
    
      self.present(controller, animated: true, completion: nil)
    }
    alertController.addAction(nextAction)
    
    locationOverlay.isHidden = true
    self.present(alertController, animated: true, completion: nil)
    
  }
  
}

