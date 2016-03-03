//
//  FindGuideViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating
import THCalendarDatePicker

class FindGuideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,EDStarRatingProtocol,THDatePickerDelegate {

  @IBOutlet weak var potentialButton: UIButton!
  @IBOutlet weak var filterButton: UIButton!
  @IBOutlet weak var guideTableView: UITableView!
  var curFromDate : NSDate? = NSDate()
  lazy var calendarPicker : THDatePickerViewController = {
    let picker = THDatePickerViewController.datePicker()
    picker.delegate = self
    picker.date = self.curFromDate
    picker.selectedBackgroundColor = UIColor(hex: "#E13F53")
    picker.currentDateColor = UIColor.whiteColor()
    picker.currentDateColorSelected = UIColor.whiteColor()
    return picker
  }()
  var dateViewContainer:PickDateView!
  var guideList:[GuideObject] = []
  var isSearchSelected:Bool! = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
    func configureView(){
      let searchButton = UIButton(type: .System)
      searchButton.frame = CGRectMake(0, 0, 29, 29);
      searchButton.setImage(UIImage(named:"search-icon"), forState: UIControlState.Normal)
      searchButton.addTarget(self, action: "showSearch:", forControlEvents: .TouchUpInside)
      searchButton.tintColor = UIColor.whiteColor()
      
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
      self.guideTableView.delegate = self
      self.guideTableView.dataSource = self
      self.guideTableView.estimatedRowHeight = 219
      self.guideTableView.rowHeight = UITableViewAutomaticDimension
      
      self.potentialButton.layer.cornerRadius = 4
      self.filterButton.layer.cornerRadius = 4
      self.filterButton.addTarget(self, action: "showFilterView", forControlEvents: .TouchUpInside)
      guideList = GuideObject.getGuide()
      
      setupDatePickerView()
    }
  
    func setupDatePickerView(){
      
      dateViewContainer = NSBundle.mainBundle().loadNibNamed("PickDateView", owner: nil, options: nil).first as! PickDateView
      dateViewContainer.frame = self.view.bounds
      dateViewContainer.backgroundColor = UIColor.whiteColor()
      dateViewContainer.containerView.layer.borderColor = UIColor.darkGrayColor().CGColor
      dateViewContainer.containerView.layer.borderWidth = 0.5
  
      
      dateViewContainer.hidden = true
      
      calendarPicker.setDisableYearSwitch(true)
      //calendarPicker.view.center = dateViewContainer.containerView.center
      calendarPicker.view.frame = dateViewContainer.containerView.bounds
      
      dateViewContainer.containerView.addSubview(calendarPicker.view)
      self.addChildViewController(calendarPicker)
      calendarPicker.didMoveToParentViewController(self)
      
      self.view.addSubview(dateViewContainer)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return guideList.count
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.guideTableView.dequeueReusableCellWithIdentifier("guideCells") as! GuideViewCell
      let guide = guideList[indexPath.row]
      cell.guideNameLabel.text = guide.guideName
      cell.guidePhotoView.image = UIImage(named: guide.guideImage)
      
      cell.guideCoverView.image = UIImage(named: guide.coverImage)
      
      cell.priceLabel.text = guide.price
      cell.tourTypesLabel.text = guide.tourTypes
      cell.timeAgoLabel.text = guide.locationDistance
      cell.reviewLabel.text = guide.reviews
      cell.guidePhotoView.layer.cornerRadius  = CGRectGetWidth(cell.guidePhotoView.bounds) / 2
      cell.guidePhotoView.layer.borderWidth = 2
      cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
      
      
      cell.ratingsView.rating = 3.5
      cell.ratingsView.starImage = UIImage(named:"star.png")
      cell.ratingsView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
      cell.ratingsView.maxRating = 5
      cell.ratingsView.delegate = self;
      cell.ratingsView.horizontalMargin = 0;
      cell.ratingsView.editable = false;
      cell.ratingsView.displayMode = UInt(EDStarRatingDisplayHalf)
      
      return cell
    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "Baltimore"
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("findGuideDetail") as! FindGuideDetailViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func showSearch(button:UIButton){
    
    if(isSearchSelected == true){
     dateViewContainer.hidden = true
    }else{
       dateViewContainer.hidden = false
    }
    isSearchSelected = !isSearchSelected
  }
  
  func showFilterView(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("filterView") as! FilterViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
  func datePickerDonePressed(datePicker: THDatePickerViewController!) {
    
   // dismissSemiModalView()
  }
  
  func datePickerCancelPressed(datePicker: THDatePickerViewController!) {
   // dismissSemiModalView()
  }
  
  func datePicker(datePicker: THDatePickerViewController!, selectedDate: NSDate!) {
    print("Date selected: \(selectedDate)")
    //dateViewContainer.hidden = true
   // isSearchSelected = !isSearchSelected

  }

  

}
