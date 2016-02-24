//
//  TourDetailsViewController.swift
//  Localz
//
//

import UIKit
import LTNavigationBar

class TourDetailsViewController: UITableViewController {
  @IBOutlet weak var bookActivityButton: UIButton!
  @IBOutlet weak var imageScroller: UIScrollView!
    var oldColor:UIColor!
  var imagePreview : ImagePreview!
  var imagePreviewController:UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.automaticallyAdjustsScrollViewInsets =  false;
      self.edgesForExtendedLayout = .Top
      self.tableView.tableFooterView = UIView(frame: CGRectZero)
       bookActivityButton.addTarget(self, action: "bookGuide", forControlEvents: .TouchUpInside)
      
      
      
      
   
      
      
    }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    oldColor = (self.navigationController?.navigationBar.barTintColor)!
    makeNavigationBarTransparent(self)
    
    for view in imageScroller.subviews{
      let image = view as! UIImageView
      let tap = UITapGestureRecognizer(target: self, action: "imageViewTapped:")
      image.userInteractionEnabled = true
      image.addGestureRecognizer(tap)
    }
    
  }
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    makeNavigationBarOpaque(self, color: oldColor)
  }
  override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 44
  }
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if(indexPath.row == 1 || indexPath.row == 4){
      return UITableViewAutomaticDimension
    }else{
      return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
  }
  
  override func scrollViewDidScroll(scrollView: UIScrollView) {
    let offSetY = scrollView.contentOffset.y
    if(offSetY > 50){
      let alpha = min(1, 1 - (50 + 64 - offSetY) / 64)
      self.navigationController?.navigationBar.lt_setBackgroundColor(oldColor.colorWithAlphaComponent(alpha))
    }else{
      self.navigationController?.navigationBar.lt_setBackgroundColor(oldColor.colorWithAlphaComponent(0))
    }
  }
  func imageViewTapped(tap:UITapGestureRecognizer){
    let imageView = tap.view as! UIImageView
    imagePreview  = NSBundle.mainBundle().loadNibNamed("ImagePreview", owner: nil, options: nil).first as! ImagePreview
    imagePreview.frame = self.view.frame
    imagePreview.imagePreview.image = imageView.image
    let tap = UITapGestureRecognizer(target: self, action: "viewBackgroundTapped")
    imagePreview.addGestureRecognizer(tap)
   // imagePreview.backgroundColor = UIColor.blackColor()
    imagePreviewController = UIViewController()
    imagePreviewController.view = imagePreview
    
    self.navigationController?.presentViewController(imagePreviewController, animated: false, completion: nil)
  }
  func viewBackgroundTapped(){
    imagePreviewController.dismissViewControllerAnimated(false, completion: nil)
  }
  func bookGuide(){
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("bookGuide") as! BookGuideViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }


}
