//
//  SettingsViewController.swift
//  Localz
//
//

import UIKit
import PagingMenuController

class SettingsViewController: UIViewController,PagingMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    func configureView(){
      
      let profileController = self.storyboard?.instantiateViewControllerWithIdentifier("profileSettings") as! ProfileSettingViewController
      profileController.title = "PROFILE"
      
      let paymentsController = self.storyboard?.instantiateViewControllerWithIdentifier("payments") as! PaymentsViewController  
      paymentsController.title = "PAYMENTS"
      let viewControllers = [profileController,paymentsController]
      
      let options = PagingMenuOptions()
      options.menuHeight = 44
      options.backgroundColor = UIColor(hex: "#2F2F2F")
      options.selectedBackgroundColor = UIColor(hex: "#2F2F2F")
      options.selectedTextColor = UIColor.whiteColor()
      options.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.3)
      options.font = UIFont(name: "Gotham Book", size: 13)!
      options.selectedFont = UIFont(name: "Gotham Book", size: 13)!
      options.menuDisplayMode = .SegmentedControl
      options.menuItemMode = .Underline(height: 3, color: UIColor.whiteColor(), horizontalPadding: 30, verticalPadding: 3)
      
      
      //Configure Page Controller
      let pagingMenuController = self.childViewControllers.first as! PagingMenuController
      pagingMenuController.delegate = self
      pagingMenuController.setup(viewControllers: viewControllers, options: options)
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "SETTINGS"
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func willMoveToMenuPage(page: Int) {
  }
  
  func didMoveToMenuPage(page: Int) {
  }


}
