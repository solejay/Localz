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
  var isGuideMode:Int = UserDefaults.standard.object(forKey: "mode") as! Int
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Do any additional setup after loading the view.
    }
    func configureView(){
      tableView?.tableFooterView  = UIView(frame: CGRect.zero)
      tableView?.tableHeaderView = createHeader()
      tableView?.separatorStyle = .none
      tableView?.tableHeaderView?.backgroundColor = UIColor.clear
      tableView?.backgroundColor = UIColor(hex: "#2F2F2F")
      
      
      logout = Bundle.main.loadNibNamed("LogoutView", owner: nil, options: nil)?.first as! LogoutView
      
    
     
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  
  }
  func createHeader() -> SideBarHeader{
    let header = Bundle.main.loadNibNamed("SideBarHeader", owner: nil, options: nil)?.first as! SideBarHeader
    
    header.guidePhotoView.layer.cornerRadius  = header.guidePhotoView.bounds.width / 2
    header.guidePhotoView.layer.borderWidth = 2
    header.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
    
    header.type.text = isGuideMode == 1 ? "Guide" : "Explorer"
    
    header.frame = CGRect(x: 0, y: 0, width: 260, height: 200)
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
  func selectedIndexPath() -> IndexPath! {
    if(isGuideMode == 1){
        return IndexPath(item: 1, section: 0)
    }else{
       return IndexPath(item: 0, section: 0)
    }
  }
  func  segueId(for indexPath: IndexPath!) -> String! {
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
  
   override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if(identifier == "logout" ){
      return false
    }else{
      return true
    }
  }
  func disablePanGesture(for indexPath: IndexPath!) -> Bool {
    if(indexPath.row == 0){
      return true
    }
    return false
  }
 
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.backgroundColor = UIColor.clear
   
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if(indexPath.row == 8){
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "logout") as! LogoutViewController  
      self.present(controller, animated: false, completion: nil)
    }
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cell: UITableViewCell = super.tableView(tableView, cellForRowAt: indexPath)
   
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

  func configureMenuButton(_ menuButton: UIButton!) {
    menuButton.frame = CGRect(x: 0, y: 0, width: 40, height: 29);
    menuButton.setImage(UIImage(named:"menu-icon"), for: UIControlState())
  }
  
  func configureSlideLayer(_ layer: CALayer!) {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.3;
  }
  func leftMenuVisibleWidth() -> CGFloat {
    return 260
  }
    

  

}
