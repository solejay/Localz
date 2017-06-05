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
    let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
    closeButton.setImage(UIImage(named: "closeButton"), for: UIControlState())
    closeButton.tintColor = UIColor.white
    closeButton.addTarget(self, action: #selector(BookActivityDetailsController.closeButtonTapped), for: .touchUpInside)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    
    cancelActivityView = Bundle.main.loadNibNamed("CancelActivitiesView", owner: nil, options: nil)?.first as! CancelActivitiesView
    cancelActivityView.frame = self.view.bounds
    cancelActivityView.cancelDetailsHeight.constant = 0
    cancelActivityView.isHidden = true
    closeButton.addTarget(self, action: #selector(BookActivityDetailsController.closeButtonTapped), for: .touchUpInside)
    cancelActivityView.takeBackButton.addTarget(self, action: #selector(BookActivityDetailsController.takeBackButtonPressed), for: .touchUpInside)
    cancelActivityView.dontCancelButton.addTarget(self, action: #selector(BookActivityDetailsController.dontCancelButtonPressed), for: .touchUpInside)
    self.view.addSubview(cancelActivityView)
    
    
    scheduleTimeView = Bundle.main.loadNibNamed("ScheduleTimeView", owner: nil, options: nil)?.first as! ScheduleTimeView
    scheduleTimeView.frame = containerView.bounds
    self.buttonConstraintsForStart()
    self.buttonConstraintsForEnd()
    
    containerView.addSubview(scheduleTimeView)
    
    selectTransportView = Bundle.main.loadNibNamed("SelectTransportView", owner: nil, options: nil)?.first as! SelectTransportView
    selectTransportView.frame = containerView.bounds
    selectTransportView.isHidden = true
    selectTransportView.noButton.addTarget(self, action: #selector(BookActivityDetailsController.noTransportButtonPressed), for: .touchUpInside)
    selectTransportView.pickUpButton.addTarget(self, action: #selector(BookActivityDetailsController.transportButtonPressed), for: .touchUpInside)
    containerView.addSubview(selectTransportView)
    
     chooseLanguage = Bundle.main.loadNibNamed("ChooseLanguage", owner: nil, options: nil)?.first as! ChooseLanguage
    chooseLanguage.isHidden = true
    chooseLanguage.button1.addTarget(self, action: #selector(BookActivityDetailsController.buttonTapped), for: .touchUpInside)
    chooseLanguage.button2.addTarget(self, action: #selector(BookActivityDetailsController.buttonTapped), for: .touchUpInside)

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
    let verticalConstraits = NSLayoutConstraint.constraints(withVisualFormat: "V:|-edgeMargin-[button1(==height)]|", options: .alignAllCenterX, metrics: metrics, views: views)
    NSLayoutConstraint.activate(verticalConstraits)
    
    let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[button1(==width)]-betweenMargin-[button2(==width)]-betweenMargin-[button3(==width)]-betweenMargin-[button4(==width)]-betweenMargin-[button5(==width)]-betweenMargin-[button6(==width)]-betweenMargin-[button7(==width)]-betweenMargin-[button8(==width)]-betweenMargin-[button9(==width)]-betweenMargin-[button10(==width)]-edgeMargin-|", options: [.alignAllTop , .alignAllBottom], metrics: metrics, views: views)
    NSLayoutConstraint.activate(horizontalConstraints)
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
    let verticalConstraits = NSLayoutConstraint.constraints(withVisualFormat: "V:|-edgeMargin-[button3(==height)]|", options: .alignAllCenterX, metrics: metrics, views: views)
    NSLayoutConstraint.activate(verticalConstraits)
    
    let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeMargin-[button3(==width)]-betweenMargin-[button4(==width)]-betweenMargin-[button5(==width)]-betweenMargin-[button6(==width)]-betweenMargin-[button7(==width)]-betweenMargin-[button8(==width)]-betweenMargin-[button9(==width)]-betweenMargin-[button10(==width)]-edgeMargin-|", options: [.alignAllTop , .alignAllBottom], metrics: metrics, views: views)
    NSLayoutConstraint.activate(horizontalConstraints)
  }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "BOOK YOUR GUIDE"
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
  
  //MARK: ScheduleTimeView
  fileprivate func createSliderButtons(_ title:String, tag:Int) -> UIButton{
    let button = UIButton()
    button.setTitle(title, for: UIControlState())
    button.titleLabel?.font = UIFont(name: "Gotham Book", size: 15)
    button.frame = CGRect(x: 0, y: 0, width: 75, height: 44)
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor(hex: "2F2F2F").cgColor
    button.setTitleColor(UIColor(hex: "2F2F2F"), for: UIControlState())
    button.layer.cornerRadius = 4
    button.tag = tag
    button.addTarget(self, action: #selector(BookActivityDetailsController.startButtonSelected(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    scheduleTimeView.startScrolView.addSubview(button)
    
    return button
  }
  fileprivate func createSliderButtonForEndTime(_ title:String,tag:Int) -> UIButton{
    let button = UIButton()
    button.setTitle(title, for: UIControlState())
    button.titleLabel?.font = UIFont(name: "Gotham Book", size: 15)
    button.frame = CGRect(x: 0, y: 0, width: 75, height: 44)
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor(hex: "2F2F2F").cgColor
    button.setTitleColor(UIColor(hex: "2F2F2F"), for: UIControlState())
    button.layer.cornerRadius = 4
    button.tag = tag
    button.addTarget(self, action: #selector(BookActivityDetailsController.endButtonSelected(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    scheduleTimeView.endScrollView.addSubview(button)
    
    return button
  }
  func startButtonSelected(_ button:UIButton)
  {
    button.isSelected = true
    startTimeButtonList.filter { (butt) -> Bool in
      button.tag != butt.tag
    }.forEach { (butt) -> () in
      butt.isSelected = false
      self.styleForSelectedButton(butt)
    }
    self.styleForSelectedButton(button)
    //Check if end time is selected from the button list, if true show next view
    selectedEndTimeButton = endTimeButtonList.filter { (butt) -> Bool in
      return butt.isSelected == true
    }.first
    if(selectedEndTimeButton != .none){
      selectTransportView.isHidden = false
      scheduleTimeView.isHidden = true
      setTimeLabel(button,end: selectedEndTimeButton)
    }else{
      selectTransportView.isHidden = true
      scheduleTimeView.isHidden = false
    }
  }
  func endButtonSelected(_ button:UIButton)
  {
    //Style button when button tapped
    button.isSelected = true
    endTimeButtonList.filter { (butt) -> Bool in
      button.tag != butt.tag
      }.forEach { (butt) -> () in
        butt.isSelected = false
        self.styleForSelectedButton(butt)
    }
    self.styleForSelectedButton(button)
    
    //Check if start time is selected from the button list, if true show next view
    selectedStartTimeButton = startTimeButtonList.filter { (butt) -> Bool in
      return butt.isSelected == true
    }.first
    if(selectedStartTimeButton != .none){
      selectTransportView.isHidden = false
      scheduleTimeView.isHidden = true
      setTimeLabel(selectedStartTimeButton,end: button)
    }else{
      selectTransportView.isHidden = true
      scheduleTimeView.isHidden = false
    }
  }
  
  func setTimeLabel(_ start:UIButton ,end:UIButton){
    timeLabel.text = "\(start.titleLabel!.text!) - \(end.titleLabel!.text!)"
    timeLabel.isHidden = false
  }
  
  func styleForSelectedButton(_ button:UIButton){
    if button.isSelected == true{
       button.setTitleColor(UIColor.white , for: UIControlState())
       button.backgroundColor = UIColor(hex: "2F2F2F")
    }else{
      button.setTitleColor(UIColor(hex: "2F2F2F"), for: UIControlState())
       button.backgroundColor = UIColor.white
    }
    
  }
  
  //MARK: SelectTransportView
  func noTransportButtonPressed(){
    chooseLanguage.isHidden = false
    selectTransportView.isHidden = true
    
  }
  func transportButtonPressed(){
    selectTransportView.addLocationButton.isHidden = false
    selectTransportView.addLocationButton.layer.borderColor = UIColor(hex: "#2F2F2F").cgColor
    selectTransportView.addLocationButton.layer.borderWidth = 2
    selectTransportView.addLocationButton.layer.cornerRadius = 4
    selectTransportView.addLocationButton.addTarget(self, action: #selector(BookActivityDetailsController.showLocationView), for: .touchUpInside)
    selectTransportView.addresLabel.isHidden = false
  }
  func showLocationView(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "location") as! LocationViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  //MARK: ChooseLanguageView
  func buttonTapped(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "confirmDetails") as! ConfirmDetailsViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

}
