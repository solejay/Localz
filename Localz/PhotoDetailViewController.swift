//
//  PhotoDetailViewController.swift
//  Localz
//
//

import UIKit

class PhotoDetailViewController: UIViewController {

  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  
  @IBOutlet weak var makeCoverButton: UIButton!
  @IBOutlet weak var deleteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       configureView()
    }
    func configureView(){
      makeCoverButton.layer.cornerRadius = 4
      makeCoverButton.layer.borderColor = UIColor.blackColor().CGColor
      makeCoverButton.layer.borderWidth = 2
    }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title = "PHOTO 1"
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
