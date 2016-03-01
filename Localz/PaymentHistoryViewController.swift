//
//  PaymentHistoryViewController.swift
//  Localz
//
//

import UIKit

class PaymentHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

  @IBOutlet weak var paymentHistoryTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

       configureView()
    }
  func configureView(){
    paymentHistoryTableView.dataSource = self
    paymentHistoryTableView.delegate = self
    paymentHistoryTableView.tableFooterView = UIView(frame: CGRectZero)
    
    //paymentHistoryTableView.estimatedRowHeight = 117
    paymentHistoryTableView.rowHeight = 117
    
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell  = paymentHistoryTableView.dequeueReusableCellWithIdentifier("paymentHistoryCell") as! PaymentHistoryCell
    return cell
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
