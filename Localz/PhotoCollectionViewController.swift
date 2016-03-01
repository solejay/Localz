//
//  PhotoCollectionViewController.swift
//  Localz
//
//

import UIKit

class PhotoCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

  @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
    }
  func configureView(){
    photoCollectionView.dataSource = self
    photoCollectionView.delegate = self
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addPhoto")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.title   = "MY PHOTOS"
  }
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = photoCollectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
    //let photo = self.photoList[indexPath.row]
   // cell.photo.sd_setImageWithURL(NSURL(string: photo.url!), placeholderImage: .None)
    
    return cell
  }
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width = (self.view.bounds.size.width / 3) - 20
    return CGSizeMake(width, width)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsetsMake(15,15,5,15)
    
    
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    
    return 10
    
  }
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    print(indexPath.row)
    let controller = self.storyboard?.instantiateViewControllerWithIdentifier("photoDetail") as! PhotoDetailViewController
    self.navigationItem.title = ""
    self.navigationController?.pushViewController(controller, animated: true)
    
  }
  func addPhoto(){
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
