//
//  UpcomingViewController.swift
//  Localz
//
//

import UIKit

class UpcomingViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

  @IBOutlet weak var upcomingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

  
    func configureView(){
        
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
        upcomingTableView.registerNib(UINib(nibName: "UpcomingCell", bundle: nil), forCellReuseIdentifier: "upcomingCell")
      
        upcomingTableView.tableFooterView = UIView(frame: CGRectZero)
        upcomingTableView.estimatedRowHeight = 44
        upcomingTableView.rowHeight = UITableViewAutomaticDimension
    }
    
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "UPCOMING ACTIVITIES"
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = upcomingTableView.dequeueReusableCellWithIdentifier("upcomingCell") as! UpComingCell
    cell.guidePhotoView.layer.cornerRadius  = CGRectGetWidth(cell.guidePhotoView.bounds) / 2
    cell.guidePhotoView.layer.borderWidth = 2
    cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("upcomingDetail") as!UpcomingDetailController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
   

}
