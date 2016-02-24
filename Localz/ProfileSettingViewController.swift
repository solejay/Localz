//
//  ProfileSettingViewController.swift
//  Localz
//
//

import UIKit

class ProfileSettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.tableFooterView = UIView(frame: CGRectZero)
      self.tableView.estimatedRowHeight = 70
      self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if(indexPath.row == 2){
      let controller = self.storyboard?.instantiateViewControllerWithIdentifier("descView") as! DescriptionViewController
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }

    // MARK: - Table view data source

  
}
