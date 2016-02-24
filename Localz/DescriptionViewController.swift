//
//  DescriptionViewController.swift
//  Localz
//
//

import UIKit

class DescriptionViewController: UIViewController {

  @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }
  func configureView(){
    let rightButton = UIButton(type: .System)
    rightButton.setTitle("Save", forState: .Normal)
    rightButton.tintColor = UIColor(hex: "#E13F53")
    rightButton.frame = CGRectMake(0, 0, 50, 44)
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    
    self.descriptionTextView.font = UIFont(name: "Avenir", size: 15)
    self.descriptionTextView.text = "I have lived in Baltimore for 7 years and know the city well. I have great knowledge of all of the ins and outs of the city and I have connections all over the downtown and surrounding areas. I’m naturally outgoing and love introducing people to the locals to get a feel for what’s truly great about our city. It seems like every time I go outside I meet new folks with new stories to tell.I\'m here to make your trip to Baltimore the best it can be so let me know what interests you the most"
    
  
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.topItem?.title = ""
    self.title = "EDIT DESCRIPTION"
  }
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    self.descriptionTextView.becomeFirstResponder()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
