//
//  FindGuideViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating

class FindGuideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,EDStarRatingProtocol {

  @IBOutlet weak var potentialButton: UIButton!
  @IBOutlet weak var filterButton: UIButton!
  @IBOutlet weak var guideTableView: UITableView!
  var guideList:[GuideObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
  
    func configureView(){
      let searchButton = UIButton(type: .System)
      searchButton.frame = CGRectMake(0, 0, 29, 29);
      searchButton.setImage(UIImage(named:"search-icon"), forState: UIControlState.Normal)
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
  
  func showFilterView(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("filterView") as! FilterViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
    

  

}
