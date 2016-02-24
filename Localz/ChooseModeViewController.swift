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
    explorerButton.selected = true
    explorerButton.addTarget(self, action: "explore:", forControlEvents: .TouchUpInside)
    
    guideButton.layer.cornerRadius = 5
    guideButton.selected = false
    guideButton.addTarget(self, action: "guide:", forControlEvents: .TouchUpInside)
    
    buttonStyleForState(explorerButton)
    buttonStyleForState(guideButton)
    
    locationOverlay = NSBundle.mainBundle().loadNibNamed("LocationOverlay", owner: nil, options: nil).first as! LocationOverlay
    locationOverlay.frame = self.view.bounds
    locationOverlay.gotItButton.addTarget(self, action: "gotItButtonPressed", forControlEvents: .TouchUpInside)
    locationOverlay.hidden = true
    self.view.addSubview(locationOverlay)
    
    
  }

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
  
  func buttonStyleForState(button:UIButton){
    if(button.selected == true){
      button.backgroundColor = UIColor(hex: "#E13F53")
      button.layer.borderWidth = 0
    }else{
      button.backgroundColor = UIColor.clearColor()
      button.layer.borderWidth = 0.5
      button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
  }
  

}
extension ChooseModeViewController{
  func explore(button:UIButton){
    button.selected = !button.selected
    guideButton.selected = !guideButton.selected
    buttonStyleForState(button)
    buttonStyleForState(guideButton)
    locationOverlay.hidden = false
    
  }
  func guide(button:UIButton){
    button.selected = !button.selected
    explorerButton.selected = !explorerButton.selected
    buttonStyleForState(button)
    buttonStyleForState(explorerButton)
    locationOverlay.hidden = false
  }
  func gotItButtonPressed(){
    let alertController = UIAlertController(title: "\"Localz\" Would Like to Use Your Current Location", message: "", preferredStyle: .Alert)
    let cancelAction: UIAlertAction = UIAlertAction(title: "Don't Allow", style: .Cancel) { action -> Void in
      //Do some stuff
    }
    alertController.addAction(cancelAction)
    //Create and an option action
    let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
      //Do some other stuff
      let controller = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! SASlideMenuRootViewController
      self.presentViewController(controller, animated: true, completion: nil)
    }
    alertController.addAction(nextAction)
    
    locationOverlay.hidden = true
    self.presentViewController(alertController, animated: true, completion: nil)
    
  }
  
}

