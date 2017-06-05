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
      self.edgesForExtendedLayout = .top
      self.tableView.tableFooterView = UIView(frame: CGRect.zero)
       bookActivityButton.addTarget(self, action: #selector(TourDetailsViewController.bookGuide), for: .touchUpInside)
      
      
      
      
   
      
      
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    oldColor = (self.navigationController?.navigationBar.barTintColor)!
    makeNavigationBarTransparent(self)
    
    for view in imageScroller.subviews{
      let image = view as! UIImageView
      let tap = UITapGestureRecognizer(target: self, action: #selector(TourDetailsViewController.imageViewTapped(_:)))
      image.isUserInteractionEnabled = true
      image.addGestureRecognizer(tap)
    }
    
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    makeNavigationBarOpaque(self, color: oldColor)
  }
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if(indexPath.row == 1 || indexPath.row == 4){
      return UITableViewAutomaticDimension
    }else{
      return super.tableView(tableView, heightForRowAt: indexPath)
    }
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offSetY = scrollView.contentOffset.y
    if(offSetY > 50){
      let alpha = min(1, 1 - (50 + 64 - offSetY) / 64)
      self.navigationController?.navigationBar.lt_setBackgroundColor(oldColor.withAlphaComponent(alpha))
    }else{
      self.navigationController?.navigationBar.lt_setBackgroundColor(oldColor.withAlphaComponent(0))
    }
  }
  func imageViewTapped(_ tap:UITapGestureRecognizer){
    let imageView = tap.view as! UIImageView
    imagePreview  = Bundle.main.loadNibNamed("ImagePreview", owner: nil, options: nil)?.first as! ImagePreview
    imagePreview.frame = self.view.frame
    imagePreview.imagePreview.image = imageView.image
    let tap = UITapGestureRecognizer(target: self, action: #selector(TourDetailsViewController.viewBackgroundTapped))
    imagePreview.addGestureRecognizer(tap)
   // imagePreview.backgroundColor = UIColor.blackColor()
    imagePreviewController = UIViewController()
    imagePreviewController.view = imagePreview
    
    self.navigationController?.present(imagePreviewController, animated: false, completion: nil)
  }
  func viewBackgroundTapped(){
    imagePreviewController.dismiss(animated: false, completion: nil)
  }
  func bookGuide(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "bookGuide") as! BookGuideViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }


}
