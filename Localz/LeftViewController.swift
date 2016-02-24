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
      logout.frame = self.view.bounds
      logout.hidden = true
      self.view.addSubview(logout)
    }
  func createHeader() -> SideBarHeader{
    let header = NSBundle.mainBundle().loadNibNamed("SideBarHeader", owner: nil, options: nil).first as! SideBarHeader
    
    header.guidePhotoView.layer.cornerRadius  = CGRectGetWidth(header.guidePhotoView.bounds) / 2
    header.guidePhotoView.layer.borderWidth = 2
    header.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    
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
    return NSIndexPath(forItem: 0, inSection: 0)
  }
  func  segueIdForIndexPath(indexPath: NSIndexPath!) -> String! {
    var stringIndex:String!
    print(indexPath.row)
    switch(indexPath.row){
    case 0 : stringIndex = "home"
    case 1 : stringIndex = "upcoming"
    case 2 : stringIndex = "history"
    case 3 : stringIndex = "settings"
    default : stringIndex = "home"
      //default : stringIndex = "settings"
    }
    return stringIndex
  }
  
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    cell.backgroundColor = UIColor.clearColor()
   
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
