//
//  GuideObject.swift
//  Localz
//
//

import UIKit

class GuideObject: NSObject {
  
  var guideName:String!
  var reviews:String!
  var locationDistance:String!
  var tourTypes:String!
  var guideImage:String!
  var price:String!
  var coverImage:String!
  
  override init() {
    super.init()
  }
  
  class func getGuide() -> [GuideObject]{
    var guides:[GuideObject] = []
    let guide1 = GuideObject()
    guide1.guideName = "Renaissance Dan"
    guide1.guideImage = "headshot-dan"
    guide1.reviews = "52 Reviews"
    guide1.tourTypes = "Nightlife, Museums, Outdoors"
    guide1.price = "$18"
    guide1.locationDistance = "1.8mi."
    guide1.coverImage = "localz1"
    
    let guide2 = GuideObject()
    guide2.guideName = "Sarah the Great"
    guide2.guideImage = "headshot-sarah"
    guide2.reviews = "24 Reviews"
    guide2.tourTypes = "Historical, Architecture"
    guide2.price = "$22"
    guide2.locationDistance = "2.4mi."
    guide2.coverImage = "localz2"
    
    let guide3 = GuideObject()
    guide3.guideName = "Razz Cass"
    guide3.guideImage = "headshot"
    guide3.reviews = "33 Reviews"
    guide3.tourTypes = "Nightlife, Museums, Outdoors"
    guide3.price = "$20"
    guide3.locationDistance = "1.8mi."
    guide3.coverImage = "localz3"
    
    let guide4 = GuideObject()
    guide4.guideName = "Renaissance Dan"
    guide4.guideImage = "headshot-dan"
    guide4.reviews = "52 Reviews"
    guide4.tourTypes = "Nightlife, Museums, Outdoors"
    guide4.price = "$18"
    guide4.locationDistance = "1.8mi."
    guide4.coverImage = "localz1"
    
    let guide5 = GuideObject()
    guide5.guideName = "Sarah the Great"
    guide5.guideImage = "headshot-sarah"
    guide5.reviews = "24 Reviews"
    guide5.tourTypes = "Historical, Architecture"
    guide5.price = "$22"
    guide5.locationDistance = "2.4mi."
    guide5.coverImage = "localz2"
    
    let guide6 = GuideObject()
    guide6.guideName = "Razz Cass"
    guide6.guideImage = "headshot"
    guide6.reviews = "33 Reviews"
    guide6.tourTypes = "Nightlife, Museums, Outdoors"
    guide6.price = "$20"
    guide6.locationDistance = "1.8mi."
    guide6.coverImage = "localz3"

    
    
    guides.append(guide1)
     guides.append(guide2)
     guides.append(guide3)
    guides.append(guide4)
    guides.append(guide5)
    guides.append(guide6)
    
    return guides
  }
  

}
