//
//  PendingRequestController.swift
//  Localz
//
//

import UIKit

class PendingRequestController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var pendingRequestTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
  }
  
  func configureView(){
    pendingRequestTableView.dataSource = self
    pendingRequestTableView.delegate = self
    pendingRequestTableView.tableFooterView = UIView(frame: CGRectZero)
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell  = pendingRequestTableView.dequeueReusableCellWithIdentifier("pendingRequestCell") as! PendingRequestCell
    cell.userPhotoView.layer.cornerRadius = CGRectGetWidth(cell.userPhotoView.frame) / 2
    cell.userPhotoView.layer.borderWidth = 2
    cell.userPhotoView.layer.borderColor = UIColor(hex: "E13F53").CGColor
    
    
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("pendingRequestDetail") as! PendingRequestDetailController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
