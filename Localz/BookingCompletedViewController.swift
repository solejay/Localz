//
//  BookingCompletedViewController.swift
//  Localz
//
//

import UIKit

class BookingCompletedViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    func configureView(){
      scrollView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 150, right: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
