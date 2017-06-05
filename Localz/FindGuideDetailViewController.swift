//
//  FindGuideDetailViewController.swift
//  Localz
//
//

import UIKit
import EDStarRating
import LTNavigationBar

class FindGuideDetailViewController: UITableViewController {
  var oldColor:UIColor!
  
  @IBOutlet weak var guidePhotoView: UIImageView!
  @IBOutlet weak var ratingsView1: EDStarRating!
  @IBOutlet weak var ratingsView2: EDStarRating!
  
  @IBOutlet weak var bookGuideButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.automaticallyAdjustsScrollViewInsets =  false;
      self.edgesForExtendedLayout = .top
     // self.extendedLayoutIncludesOpaqueBars = false
      self.tableView.tableFooterView = UIView(frame: CGRect.zero)
      
      bookGuideButton.addTarget(self, action: #selector(FindGuideDetailViewController.bookGuide), for: .touchUpInside)
      guidePhotoView.layer.cornerRadius  = guidePhotoView.bounds.width / 2
      guidePhotoView.layer.borderWidth = 2
      guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
      
      
      ratingsView1.rating = 3.5
      ratingsView1.starImage = UIImage(named:"star.png")
      ratingsView1.starHighlightedImage =  UIImage(named:"starhighlighted.png");
      ratingsView1.maxRating = 5
     // ratingsView1.delegate = self;
      ratingsView1.horizontalMargin = 0;
      ratingsView1.editable = false;
     ratingsView1.displayMode = UInt(EDStarRatingDisplayHalf)
      
      
      ratingsView2.rating = 3.5
      ratingsView2.starImage = UIImage(named:"star.png")
      ratingsView2.starHighlightedImage =  UIImage(named:"starhighlighted.png");
      ratingsView2.maxRating = 5
      // ratingsView1.delegate = self;
      ratingsView2.horizontalMargin = 0;
      ratingsView1.editable = false;
      ratingsView2.displayMode = UInt(EDStarRatingDisplayHalf)
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    oldColor = (self.navigationController?.navigationBar.barTintColor)!
    makeNavigationBarTransparent(self)
    
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
     makeNavigationBarOpaque(self, color: oldColor)
  }
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     if(indexPath.row == 2 || indexPath.row == 4){
      return UITableViewAutomaticDimension
    }else{
      return super.tableView(tableView, heightForRowAt: indexPath)
    }
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if(indexPath.row == 3){
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "tourDetails") as! TourDetailsViewController
      self.navigationItem.title = ""
      self.navigationController?.pushViewController(controller, animated: true)
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
  
  func bookGuide(){
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "bookGuide") as! BookGuideViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

    
}
