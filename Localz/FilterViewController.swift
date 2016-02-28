//
//  FilterViewController.swift
//  Localz
//
//

import UIKit
import MARKRangeSlider

class FilterViewController: UIViewController {

  @IBOutlet weak var catergoryTextField: UITextField!
  
  @IBOutlet weak var languagesTextField: UITextField!
  
  @IBOutlet weak var guideTransportYesButton: UIButton!
  
  @IBOutlet weak var pickupNoButton: UIButton!
  @IBOutlet weak var pickupYesButton: UIButton!
  
  @IBOutlet weak var applyFilterButton: UIButton!
  @IBOutlet weak var guideTransportNoButton: UIButton!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var slider: MARKRangeSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "FILTERS"
  }
    func configureView(){
      print(self.view.bounds.size.height)
      if(self.view.bounds.size.height == 480){
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 183, right: 0)
      }
      else if(self.view.bounds.size.height == 568){
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 95, right: 0)
      }
      self.slider.rangeImage = UIImage(named: "trackRed")
      self.slider.trackImage = UIImage(named: "trackGray")
      self.slider.leftThumbImage = UIImage(named: "sliderHandle")
      self.slider.rightThumbImage = UIImage(named: "sliderHandle")
      self.slider.setMinValue(10, maxValue: 100)
      self.slider.setLeftValue(10, rightValue: 60)
      self.slider.minimumDistance = 10
      
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style:.Plain, target: self, action: "cancel")
      
      let layer = CALayer()
      layer.frame = CGRectMake(0, CGRectGetHeight(catergoryTextField.bounds) - 1, CGRectGetWidth(catergoryTextField.bounds), 0.5)
      layer.backgroundColor = UIColor.darkGrayColor().CGColor
      catergoryTextField.layer.addSublayer(layer)
      
      let languageLayer = CALayer()
      languageLayer.frame = CGRectMake(0, CGRectGetHeight(languagesTextField.bounds) - 1, CGRectGetWidth(languagesTextField.bounds), 0.5)
      languageLayer.backgroundColor = UIColor.darkGrayColor().CGColor
      languagesTextField.layer.addSublayer(languageLayer)
      
    }
  
  func cancel(){
    self.navigationController?.popViewControllerAnimated(true)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
