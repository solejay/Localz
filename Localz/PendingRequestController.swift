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
    pendingRequestTableView.tableFooterView = UIView(frame: CGRect.zero)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PENDING REQUESTS"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell  = pendingRequestTableView.dequeueReusableCell(withIdentifier: "pendingRequestCell") as! PendingRequestCell
    cell.userPhotoView.layer.cornerRadius = cell.userPhotoView.frame.width / 2
    cell.userPhotoView.layer.borderWidth = 2
    cell.userPhotoView.layer.borderColor = UIColor(hex: "E13F53").cgColor
    
    
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "pendingRequestDetail") as! PendingRequestDetailController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
