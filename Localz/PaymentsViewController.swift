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
      cardView = Bundle.main.loadNibNamed("CardView", owner: nil, options: nil)?.first as!  CardView
      cardView.frame = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: 250)
      cardView.isHidden = true
      addLeftViewtoTextField(cardView.cardNumberTextField, width: 10)
      addCorneredBorder(cardView.cardNumberTextField)
      addLeftViewtoTextField(cardView.fullNameTextField, width: 10)
      addCorneredBorder(cardView.fullNameTextField)
      addLeftViewtoTextField(cardView.cvcTextField, width: 10)
      addCorneredBorder(cardView.cvcTextField)
      addLeftViewtoTextField(cardView.monthTextField, width: 10)
      addCorneredBorder(cardView.monthTextField)
      self.containerView.addSubview(cardView)
      
      payPalButton.isSelected = true
      self.styleForSelectedButton(payPalButton)
      payPalButton.addTarget(self, action: #selector(PaymentsViewController.doPayPalAction), for: .touchUpInside)
      
      visaButton.isSelected = false
      self.styleForSelectedButton(visaButton)
      visaButton.addTarget(self, action: #selector(PaymentsViewController.doVisaAction), for: .touchUpInside)
  }
  
  func styleForSelectedButton(_ button:UIButton)
    {
      if(button.isSelected == true){
        button.layer.borderColor = UIColor(hex: "#EFB961").cgColor
        button.layer.borderWidth = 1
        
      }else{
        button.layer.borderColor = UIColor(hex: "#BFBFBF").cgColor
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
    payPalButton.isSelected = true
    self.styleForSelectedButton(payPalButton)
    
    visaButton.isSelected = false
    self.styleForSelectedButton(visaButton)
  }
  func doVisaAction(){
    self.showCardView(true)
    payPalButton.isSelected = false
    self.styleForSelectedButton(payPalButton)
    
    visaButton.isSelected = true
    self.styleForSelectedButton(visaButton)
  }
  
  func showCardView(_ show:Bool){
    if(show)  {
      cardView.isHidden = false
    }else{
      cardView.isHidden = true
    }
  }
  
  func addLeftViewtoTextField(_ textField:UITextField,width:CGFloat){
    let left = UIView(frame: CGRect(x: 0,y: 0,width: width,height: textField.frame.height))
    textField.leftView = left
    textField.leftViewMode = .always
    
  }
  
  func addCorneredBorder(_ textField:UITextField){
    textField.layer.borderColor = UIColor(hex: "#CED1D2").cgColor
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 3
    textField.delegate = self
  }
    
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
