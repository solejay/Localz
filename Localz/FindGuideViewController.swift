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
  var curFromDate : Date? = Date()
  lazy var calendarPicker : THDatePickerViewController = {
    let picker = THDatePickerViewController.datePicker()
    picker?.delegate = self
    picker?.date = self.curFromDate
    picker?.selectedBackgroundColor = UIColor(hex: "#E13F53")
    picker?.currentDateColor = UIColor.white
    picker?.currentDateColorSelected = UIColor.white
    return picker!
  }()
  var dateViewContainer:PickDateView!
  var guideList:[GuideObject] = []
  var isSearchSelected:Bool! = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
    func configureView(){
      let searchButton = UIButton(type: .system)
      searchButton.frame = CGRect(x: 0, y: 0, width: 29, height: 29);
      searchButton.setImage(UIImage(named:"search-icon"), for: UIControlState())
      searchButton.addTarget(self, action: #selector(FindGuideViewController.showSearch(_:)), for: .touchUpInside)
      searchButton.tintColor = UIColor.white
      
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
      self.guideTableView.delegate = self
      self.guideTableView.dataSource = self
      self.guideTableView.estimatedRowHeight = 219
      self.guideTableView.rowHeight = UITableViewAutomaticDimension
      
      self.potentialButton.layer.cornerRadius = 4
      self.filterButton.layer.cornerRadius = 4
      self.filterButton.addTarget(self, action: #selector(FindGuideViewController.showFilterView), for: .touchUpInside)
      guideList = GuideObject.getGuide()
      
      setupDatePickerView()
    }
  
    func setupDatePickerView(){
      
      dateViewContainer = Bundle.main.loadNibNamed("PickDateView", owner: nil, options: nil)?.first as! PickDateView
      dateViewContainer.frame = self.view.bounds
      dateViewContainer.backgroundColor = UIColor.white
      dateViewContainer.containerView.layer.borderColor = UIColor.darkGray.cgColor
      dateViewContainer.containerView.layer.borderWidth = 0.5
  
      
      dateViewContainer.isHidden = true
      
      calendarPicker.setDisableYearSwitch(true)
      //calendarPicker.view.center = dateViewContainer.containerView.center
      calendarPicker.view.frame = dateViewContainer.containerView.bounds
      
      dateViewContainer.containerView.addSubview(calendarPicker.view)
      self.addChildViewController(calendarPicker)
      calendarPicker.didMove(toParentViewController: self)
      
      self.view.addSubview(dateViewContainer)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return guideList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.guideTableView.dequeueReusableCell(withIdentifier: "guideCells") as! GuideViewCell
      let guide = guideList[indexPath.row]
      cell.guideNameLabel.text = guide.guideName
      cell.guidePhotoView.image = UIImage(named: guide.guideImage)
      
      cell.guideCoverView.image = UIImage(named: guide.coverImage)
      
      cell.priceLabel.text = guide.price
      cell.tourTypesLabel.text = guide.tourTypes
      cell.timeAgoLabel.text = guide.locationDistance
      cell.reviewLabel.text = guide.reviews
      cell.guidePhotoView.layer.cornerRadius  = cell.guidePhotoView.bounds.width / 2
      cell.guidePhotoView.layer.borderWidth = 2
      cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
      
      
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
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "Baltimore"
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "findGuideDetail") as! FindGuideDetailViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func showSearch(_ button:UIButton){
    
    if(isSearchSelected == true){
     dateViewContainer.isHidden = true
    }else{
       dateViewContainer.isHidden = false
    }
    isSearchSelected = !isSearchSelected
  }
  
  func showFilterView(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "filterView") as! FilterViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
  func datePickerDonePressed(_ datePicker: THDatePickerViewController!) {
    
   // dismissSemiModalView()
  }
  
  func datePickerCancelPressed(_ datePicker: THDatePickerViewController!) {
   // dismissSemiModalView()
  }
  
  func datePicker(_ datePicker: THDatePickerViewController!, selectedDate: Date!) {
    print("Date selected: \(selectedDate)")
    //dateViewContainer.hidden = true
   // isSearchSelected = !isSearchSelected

  }

  

}
