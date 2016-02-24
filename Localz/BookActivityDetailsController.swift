//
//  BookActivityDetailsController.swift
//  Localz
//
//

import UIKit

class BookActivityDetailsController: UIViewController {
  @IBOutlet weak var tourTitleLabel: UILabel!

  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var datteLabel: UILabel!
  @IBOutlet weak var containerView: UIView!
   var cancelActivityView:CancelActivitiesView!
  var scheduleTimeView:ScheduleTimeView!
  var selectTransportView:SelectTransportView!
  var chooseLanguage:ChooseLanguage!
  var startTimeButtonList:[UIButton]! = []
  var endTimeButtonList:[UIButton] = []
  var selectedStartTimeButton:UIButton!
  var selectedEndTimeButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Do any additional setup after loading the view.
    }
  
  func configureView(){
    let closeButton = UIButton(frame: CGRectMake(0, 0, 44, 44))
    closeButton.setImage(UIImage(named: "closeButton"), forState: .Normal)
    closeButton.tintColor = UIColor.whiteColor()
    closeButton.addTarget(self, action: "closeButtonTapped", forControlEvents: .TouchUpInside)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
    cancelActivityView = NSBundle.mainBundle().loadNibNamed("CancelActivitiesView", owner: nil, options: nil).first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.hidden = true
    closeButton.addTarget(self, action: "closeButtonTapped", forControlEvents: .TouchUpInside)
    cancelActivityView.takeBackButton.addTarget(self, action: "takeBackButtonPressed", forControlEvents: .TouchUpInside)
    cancelActivityView.dontCancelButton.addTarget(self, action: "dontCancelButtonPressed", forControlEvents: .TouchUpInside)
    self.view.addSubview(cancelActivityView)
    
    
    scheduleTimeView = NSBundle.mainBundle().loadNibNamed("ScheduleTimeView", owner: nil, options: nil).first as! ScheduleTimeView
    scheduleTimeView.frame = containerView.bounds
    self.buttonConstraintsForStart()
    self.buttonConstraintsForEnd()
    
    containerView.addSubview(scheduleTimeView)
    
    selectTransportView = NSBundle.mainBundle().loadNibNamed("SelectTransportView", owner: nil, options: nil).first as! SelectTransportView
    selectTransportView.frame = containerView.bounds
    selectTransportView.hidden = true
    selectTransportView.noButton.addTarget(self, action: "noTransportButtonPressed", forControlEvents: .TouchUpInside)
    selectTransportView.pickUpButton.addTarget(self, action: "transportButtonPressed", forControlEvents: .TouchUpInside)
    containerView.addSubview(selectTransportView)
    
     chooseLanguage = NSBundle.mainBundle().loadNibNamed("ChooseLanguage", owner: nil, options: nil).first as! ChooseLanguage
    chooseLanguage.hidden = true
    chooseLanguage.button1.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
    chooseLanguage.button2.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)

    chooseLanguage.frame = containerView.bounds
    containerView.addSubview(chooseLanguage)
  }
  
  func buttonConstraintsForStart(){
    let button1 = createSliderButtons("3PM",tag: 1)
    let button2 = createSliderButtons("4PM",tag: 2)
    let button3 = createSliderButtons("5PM",tag: 3)
    let button4 = createSliderButtons("6PM",tag: 4)
    let button5 = createSliderButtons("7PM",tag: 5)
    let button6 = createSliderButtons("8PM",tag: 6)
    let button7 = createSliderButtons("9PM",tag: 7)
    let button8 = createSliderButtons("10PM",tag: 8)
    let button9 = createSliderButtons("11PM",tag: 9)
    let button10 = createSliderButtons("12PM",tag: 10)
    startTimeButtonList = [button1,button2,button3,button4,button5,button6,button7,button8,button9,button10]
    let metrics = ["edgeMargin":10,"betweenMargin":10,"width":75,"height":44]
    let views = ["button1":button1,"button2":button2,"button3":button3,"button4":button4,
      "button5":button5,"button6":button6,"button7":button7,"button8":button8,
      "button9":button9,"button10":button10]
    let verticalConstraits = NSLayoutConstraint.constraintsWithVisualFormat("V:|-edgeMargin-[button1(==height)]|", options: .AlignAllCenterX, metrics: metrics, views: views)
    NSLayoutConstraint.activateConstraints(verticalConstraits)
    
    let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-edgeMargin-[button1(==width)]-betweenMargin-[button2(==width)]-betweenMargin-[button3(==width)]-betweenMargin-[button4(==width)]-betweenMargin-[button5(==width)]-betweenMargin-[button6(==width)]-betweenMargin-[button7(==width)]-betweenMargin-[button8(==width)]-betweenMargin-[button9(==width)]-betweenMargin-[button10(==width)]-edgeMargin-|", options: [.AlignAllTop , .AlignAllBottom], metrics: metrics, views: views)
    NSLayoutConstraint.activateConstraints(horizontalConstraints)
  }
  func buttonConstraintsForEnd(){
    
    let button3 = createSliderButtonForEndTime("5PM",tag: 3)
    let button4 = createSliderButtonForEndTime("6PM",tag: 4)
    let button5 = createSliderButtonForEndTime("7PM",tag: 5)
    let button6 = createSliderButtonForEndTime("8PM",tag: 6)
    let button7 = createSliderButtonForEndTime("9PM",tag: 7)
    let button8 = createSliderButtonForEndTime("10PM",tag: 8)
    let button9 = createSliderButtonForEndTime("11PM",tag: 9)
    let button10 = createSliderButtonForEndTime("12PM",tag: 10)
    endTimeButtonList = [button3,button4,button5,button6,button7,button8,button9,button10]
    let metrics = ["edgeMargin":10,"betweenMargin":10,"width":75,"height":44]
    let views = ["button3":button3,"button4":button4,
      "button5":button5,"button6":button6,"button7":button7,"button8":button8,
      "button9":button9,"button10":button10]
    let verticalConstraits = NSLayoutConstraint.constraintsWithVisualFormat("V:|-edgeMargin-[button3(==height)]|", options: .AlignAllCenterX, metrics: metrics, views: views)
    NSLayoutConstraint.activateConstraints(verticalConstraits)
    
    let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-edgeMargin-[button3(==width)]-betweenMargin-[button4(==width)]-betweenMargin-[button5(==width)]-betweenMargin-[button6(==width)]-betweenMargin-[button7(==width)]-betweenMargin-[button8(==width)]-betweenMargin-[button9(==width)]-betweenMargin-[button10(==width)]-edgeMargin-|", options: [.AlignAllTop , .AlignAllBottom], metrics: metrics, views: views)
    NSLayoutConstraint.activateConstraints(horizontalConstraints)
  }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "BOOK YOUR GUIDE"
  }
  
  func closeButtonTapped(){
    cancelActivityView.hidden = false
    self.navigationController?.navigationBarHidden = true
    UIApplication.sharedApplication().statusBarHidden = true
    
  }
  func takeBackButtonPressed(){
    cancelActivityView.hidden = true
    self.navigationController?.navigationBarHidden = false
    UIApplication.sharedApplication().statusBarHidden = false
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  func dontCancelButtonPressed(){
    cancelActivityView.hidden = true
    self.navigationController?.navigationBarHidden = false
    UIApplication.sharedApplication().statusBarHidden = false
  }
  
  //MARK: ScheduleTimeView
  private func createSliderButtons(title:String, tag:Int) -> UIButton{
    let button = UIButton()
    button.setTitle(title, forState: .Normal)
    button.titleLabel?.font = UIFont(name: "Gotham Book", size: 15)
    button.frame = CGRectMake(0, 0, 75, 44)
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor(hex: "2F2F2F").CGColor
    button.setTitleColor(UIColor(hex: "2F2F2F"), forState: .Normal)
    button.layer.cornerRadius = 4
    button.tag = tag
    button.addTarget(self, action: "startButtonSelected:", forControlEvents: .TouchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    scheduleTimeView.startScrolView.addSubview(button)
    
    return button
  }
  private func createSliderButtonForEndTime(title:String,tag:Int) -> UIButton{
    let button = UIButton()
    button.setTitle(title, forState: .Normal)
    button.titleLabel?.font = UIFont(name: "Gotham Book", size: 15)
    button.frame = CGRectMake(0, 0, 75, 44)
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor(hex: "2F2F2F").CGColor
    button.setTitleColor(UIColor(hex: "2F2F2F"), forState: .Normal)
    button.layer.cornerRadius = 4
    button.tag = tag
    button.addTarget(self, action: "endButtonSelected:", forControlEvents: .TouchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    scheduleTimeView.endScrollView.addSubview(button)
    
    return button
  }
  func startButtonSelected(button:UIButton)
  {
    button.selected = true
    startTimeButtonList.filter { (butt) -> Bool in
      button.tag != butt.tag
    }.forEach { (butt) -> () in
      butt.selected = false
      self.styleForSelectedButton(butt)
    }
    self.styleForSelectedButton(button)
    //Check if end time is selected from the button list, if true show next view
    selectedEndTimeButton = endTimeButtonList.filter { (butt) -> Bool in
      return butt.selected == true
    }.first
    if(selectedEndTimeButton != .None){
      selectTransportView.hidden = false
      setTimeLabel(button,end: selectedEndTimeButton)
    }else{
      selectTransportView.hidden = true
    }
  }
  func endButtonSelected(button:UIButton)
  {
    //Style button when button tapped
    button.selected = true
    endTimeButtonList.filter { (butt) -> Bool in
      button.tag != butt.tag
      }.forEach { (butt) -> () in
        butt.selected = false
        self.styleForSelectedButton(butt)
    }
    self.styleForSelectedButton(button)
    
    //Check if start time is selected from the button list, if true show next view
    selectedStartTimeButton = startTimeButtonList.filter { (butt) -> Bool in
      return butt.selected == true
    }.first
    if(selectedStartTimeButton != .None){
      selectTransportView.hidden = false
      setTimeLabel(selectedStartTimeButton,end: button)
    }else{
      selectTransportView.hidden = true
    }
  }
  
  func setTimeLabel(start:UIButton ,end:UIButton){
    timeLabel.text = "\(start.titleLabel!.text!) - \(end.titleLabel!.text!)"
    timeLabel.hidden = false
  }
  
  func styleForSelectedButton(button:UIButton){
    if button.selected == true{
       button.setTitleColor(UIColor.whiteColor() , forState: .Normal)
       button.backgroundColor = UIColor(hex: "2F2F2F")
    }else{
      button.setTitleColor(UIColor(hex: "2F2F2F"), forState: .Normal)
       button.backgroundColor = UIColor.whiteColor()
    }
    
  }
  
  //MARK: SelectTransportView
  func noTransportButtonPressed(){
    chooseLanguage.hidden = false
  }
  func transportButtonPressed(){
    selectTransportView.addLocationButton.hidden = false
    selectTransportView.addLocationButton.layer.borderColor = UIColor(hex: "#2F2F2F").CGColor
    selectTransportView.addLocationButton.layer.borderWidth = 2
    selectTransportView.addLocationButton.layer.cornerRadius = 4
    selectTransportView.addresLabel.hidden = false
  }
  
  //MARK: ChooseLanguageView
  func buttonTapped(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("confirmDetails") as! ConfirmDetailsViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
