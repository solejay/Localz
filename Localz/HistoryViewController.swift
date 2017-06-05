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
    historyTableView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellReuseIdentifier: "upcomingCell")
    
    historyTableView.tableFooterView = UIView(frame: CGRect.zero)
    historyTableView.estimatedRowHeight = 44
    historyTableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "HISTORY"
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = historyTableView.dequeueReusableCell(withIdentifier: "upcomingCell") as! UpComingCell
    cell.guidePhotoView.layer.cornerRadius  = cell.guidePhotoView.bounds.width / 2
    cell.guidePhotoView.layer.borderWidth = 2
    cell.guidePhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "historyDetail") as! HistoryDetailViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }


  

}
