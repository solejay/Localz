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
        upcomingTableView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellReuseIdentifier: "upcomingCell")
      
        upcomingTableView.tableFooterView = UIView(frame: CGRect.zero)
        upcomingTableView.estimatedRowHeight = 44
        upcomingTableView.rowHeight = UITableViewAutomaticDimension
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "UPCOMING ACTIVITIES"
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = upcomingTableView.dequeueReusableCell(withIdentifier: "upcomingCell") as! UpComingCell
    cell.guidePhotoView.layer.cornerRadius  = cell.guidePhotoView.bounds.width / 2
    cell.guidePhotoView.layer.borderWidth = 2
    cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "upcomingDetail") as!UpcomingDetailController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }
   

}
