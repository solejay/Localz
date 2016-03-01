//
//  FilterViewController.swift
//  Localz
//
//

import UIKit
import TTRangeSlider

class FilterViewController: UIViewController,TTRangeSliderDelegate {

  @IBOutlet weak var catergoryTextField: UITextField!
  
  @IBOutlet weak var languagesTextField: UITextField!
  
  @IBOutlet weak var guideTransportYesButton: UIButton!
  
  @IBOutlet weak var pickupNoButton: UIButton!
  @IBOutlet weak var pickupYesButton: UIButton!
  
  @IBOutlet weak var applyFilterButton: UIButton!
  @IBOutlet weak var guideTransportNoButton: UIButton!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var slider: TTRangeSlider!
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

      self.slider.delegate = self;
      self.slider.minValue = 10;
      self.slider.maxValue = 100;
      self.slider.selectedMinimum = 10;
      self.slider.selectedMaximum = 60;
      self.slider.handleImage = UIImage(named: "sliderHandle")
      self.slider.selectedHandleDiameterMultiplier = 1
      self.slider.tintColorBetweenHandles = UIColor(hex: "#E13F53")
      self.slider.lineHeight = 10
      self.slider.minLabelColour  = UIColor(hex: "#E13F53")
      self.slider.maxLabelColour  = UIColor(hex: "#E13F53")
      let customFormatter = NSNumberFormatter()
      //customFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
      customFormatter.positivePrefix = "$";
      self.slider.numberFormatterOverride = customFormatter;

      
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
  func rangeSlider(sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
    
  }
  func cancel(){
    self.navigationController?.popViewControllerAnimated(true)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
