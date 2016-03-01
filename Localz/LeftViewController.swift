//
//  LeftViewController.swift
//  Localz
//
//

import UIKit
import SASlideMenu
import EDStarRating


class LeftViewController: SASlideMenuViewController,SASlideMenuDataSource,SASlideMenuDelegate {
  var logout:LogoutView!
  @IBOutlet weak var historyGuideCell: UITableViewCell!
  
  @IBOutlet weak var historyExploreCell: UITableViewCell!

  @IBOutlet weak var findGuideCell: UITableViewCell!
  
  @IBOutlet weak var pendingRequestCell: UITableViewCell!
  
  @IBOutlet weak var photoCell: UITableViewCell!
  @IBOutlet weak var manageCalenderCell: UITableViewCell!
  var historyIdentifier:String!
  var isGuideMode:Int = NSUserDefaults.standardUserDefaults().objectForKey("mode") as! Int
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Do any additional setup after loading the view.
    }
    func configureView(){
      tableView?.tableFooterView  = UIView(frame: CGRectZero)
      tableView?.tableHeaderView = createHeader()
      tableView?.separatorStyle = .None
      tableView?.tableHeaderView?.backgroundColor = UIColor.clearColor()
      tableView?.backgroundColor = UIColor(hex: "#2F2F2F")
      
      
      logout = NSBundle.mainBundle().loadNibNamed("LogoutView", owner: nil, options: nil).first as! LogoutView
      
    
     
    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  
  }
  func createHeader() -> SideBarHeader{
    let header = NSBundle.mainBundle().loadNibNamed("SideBarHeader", owner: nil, options: nil).first as! SideBarHeader
    
    header.guidePhotoView.layer.cornerRadius  = CGRectGetWidth(header.guidePhotoView.bounds) / 2
    header.guidePhotoView.layer.borderWidth = 2
    header.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    
    header.type.text = isGuideMode == 1 ? "Guide" : "Explorer"
    
    header.frame = CGRectMake(0, 0, 260, 200)
    header.ratingView.rating = 3.5
    header.ratingView.starImage = UIImage(named:"star.png")
    header.ratingView.starHighlightedImage =  UIImage(named:"starhighlighted.png");
    header.ratingView.maxRating = 5
   // header.ratingView.delegate = self;
    header.ratingView.horizontalMargin = 0;
    header.ratingView.editable = false;
    header.ratingView.displayMode = UInt(EDStarRatingDisplayHalf)
    return header
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func selectedIndexPath() -> NSIndexPath! {
    if(isGuideMode == 1){
        return NSIndexPath(forItem: 1, inSection: 0)
    }else{
       return NSIndexPath(forItem: 0, inSection: 0)
    }
  }
  func  segueIdForIndexPath(indexPath: NSIndexPath!) -> String! {
    var stringIndex:String!
    print(indexPath.row)

    switch(indexPath.row){
    case 0 : stringIndex = "home"
    case 1 : stringIndex = "upcoming"
    case 2 : stringIndex = "pendingRequest"
    case 3 : stringIndex = "manageCalendar"
    case 4 : stringIndex = "historyGuideMode"
    case 5 : stringIndex = "history"
    case 6 : stringIndex = "photos"
    case 7 : stringIndex = "settings"
    default : stringIndex = "logout"
      //default : stringIndex = "settings"
    }
    return stringIndex
  }
  
   override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
    if(identifier == "logout" ){
      return false
    }else{
      return true
    }
  }
 
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    cell.backgroundColor = UIColor.clearColor()
   
  }
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if(indexPath.row == 8){
      let controller = self.storyboard?.instantiateViewControllerWithIdentifier("logout") as! LogoutViewController  
      self.presentViewController(controller, animated: false, completion: nil)
    }
  }
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let cell: UITableViewCell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
   
    if(isGuideMode == 1){
        if(cell == findGuideCell || cell == historyExploreCell){
            return 0
        }else{
          return UITableViewAutomaticDimension
      }
    }else{
      if(cell == pendingRequestCell || cell == photoCell || cell == manageCalenderCell || cell == historyGuideCell){
        return 0
      }else{
        return UITableViewAutomaticDimension
      }
    }
    
  }

  func configureMenuButton(menuButton: UIButton!) {
    menuButton.frame = CGRectMake(0, 0, 40, 29);
    menuButton.setImage(UIImage(named:"menu-icon"), forState: UIControlState.Normal)
  }
  
  func configureSlideLayer(layer: CALayer!) {
    layer.shadowColor = UIColor.blackColor().CGColor
    layer.shadowOpacity = 0.3;
  }
  func leftMenuVisibleWidth() -> CGFloat {
    return 260
  }
    

  

}
