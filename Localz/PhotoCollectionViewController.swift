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
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(PhotoCollectionViewController.addPhoto))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title   = "MY PHOTOS"
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
    //let photo = self.photoList[indexPath.row]
   // cell.photo.sd_setImageWithURL(NSURL(string: photo.url!), placeholderImage: .None)
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (self.view.bounds.size.width / 3) - 20
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsetsMake(15,15,5,15)
    
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    return 10
    
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.row)
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "photoDetail") as! PhotoDetailViewController
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
