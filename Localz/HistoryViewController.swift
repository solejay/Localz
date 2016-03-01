//
//  HistoryViewController.swift
//  Localz
//
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
      super.viewDidLoad()
      self.configureView()
    }
  
  
  func configureView(){
    
    historyTableView.delegate = self
    historyTableView.dataSource = self
    historyTableView.registerNib(UINib(nibName: "UpcomingCell", bundle: nil), forCellReuseIdentifier: "upcomingCell")
    
    historyTableView.tableFooterView = UIView(frame: CGRectZero)
    historyTableView.estimatedRowHeight = 44
    historyTableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "HISTORY"
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = historyTableView.dequeueReusableCellWithIdentifier("upcomingCell") as! UpComingCell
    cell.guidePhotoView.layer.cornerRadius  = CGRectGetWidth(cell.guidePhotoView.bounds) / 2
    cell.guidePhotoView.layer.borderWidth = 2
    cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("historyDetail") as! HistoryDetailViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }


  

}
