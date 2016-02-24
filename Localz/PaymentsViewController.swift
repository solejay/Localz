//
//  PaymentsViewController.swift
//  Localz
//
//

import UIKit

class PaymentsViewController: UIViewController,UITextFieldDelegate {

  @IBOutlet weak var visaButton: UIButton!
  @IBOutlet weak var payPalButton: UIButton!
  @IBOutlet weak var checkOutPayPalButton: UIButton!
  @IBOutlet weak var containerView: UIView!
  var cardView:CardView!
    override func viewDidLoad() {
        super.viewDidLoad()

       configureView()
    }
    func configureView(){
      cardView = NSBundle.mainBundle().loadNibNamed("CardView", owner: nil, options: nil).first as!  CardView
      cardView.frame = CGRectMake(0, 0, containerView.frame.size.width, 250)
      cardView.hidden = true
      addLeftViewtoTextField(cardView.cardNumberTextField, width: 10)
      addCorneredBorder(cardView.cardNumberTextField)
      addLeftViewtoTextField(cardView.fullNameTextField, width: 10)
      addCorneredBorder(cardView.fullNameTextField)
      addLeftViewtoTextField(cardView.cvcTextField, width: 10)
      addCorneredBorder(cardView.cvcTextField)
      addLeftViewtoTextField(cardView.monthTextField, width: 10)
      addCorneredBorder(cardView.monthTextField)
      self.containerView.addSubview(cardView)
      
      payPalButton.selected = true
      self.styleForSelectedButton(payPalButton)
      payPalButton.addTarget(self, action: "doPayPalAction", forControlEvents: .TouchUpInside)
      
      visaButton.selected = false
      self.styleForSelectedButton(visaButton)
      visaButton.addTarget(self, action: "doVisaAction", forControlEvents: .TouchUpInside)
  }
  
  func styleForSelectedButton(button:UIButton)
    {
      if(button.selected == true){
        button.layer.borderColor = UIColor(hex: "#EFB961").CGColor
        button.layer.borderWidth = 1
        
      }else{
        button.layer.borderColor = UIColor(hex: "#BFBFBF").CGColor
        button.layer.borderWidth = 0.5

      }
      button.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func doPayPalAction(){
    self.showCardView(false)
    payPalButton.selected = true
    self.styleForSelectedButton(payPalButton)
    
    visaButton.selected = false
    self.styleForSelectedButton(visaButton)
  }
  func doVisaAction(){
    self.showCardView(true)
    payPalButton.selected = false
    self.styleForSelectedButton(payPalButton)
    
    visaButton.selected = true
    self.styleForSelectedButton(visaButton)
  }
  
  func showCardView(show:Bool){
    if(show)  {
      cardView.hidden = false
    }else{
      cardView.hidden = true
    }
  }
  
  func addLeftViewtoTextField(textField:UITextField,width:CGFloat){
    let left = UIView(frame: CGRectMake(0,0,width,CGRectGetHeight(textField.frame)))
    textField.leftView = left
    textField.leftViewMode = .Always
    
  }
  
  func addCorneredBorder(textField:UITextField){
    textField.layer.borderColor = UIColor(hex: "#CED1D2").CGColor
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 3
    textField.delegate = self
  }
    
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
