//
//  ProfileSettingViewController.swift
//  Localz
//
//

import UIKit

class ProfileSettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.tableFooterView = UIView(frame: CGRect.zero)
      self.tableView.estimatedRowHeight = 70
      self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if(indexPath.row == 2){
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "descView") as! DescriptionViewController
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }

    // MARK: - Table view data source

  
}
