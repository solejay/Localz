//
//  Utils.swift
//  Localz
//
//

import UIKit

class Utils: NSObject {
  
  
}

    
func makeNavigationBarTransparent(sourceViewController:UIViewController){
  sourceViewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
  sourceViewController.navigationController?.navigationBar.shadowImage = UIImage()
  sourceViewController.navigationController?.navigationBar.translucent = true
}
func makeNavigationBarOpaque(sourceViewController:UIViewController,color:UIColor){
  
  //  sourceViewController.navigationController?.navigationBar.barTintColor = color
  
  
  sourceViewController.navigationController?.navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImageForBarMetrics(UIBarMetrics.Default), forBarMetrics: UIBarMetrics.Default)
  sourceViewController.navigationController?.navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
  sourceViewController.navigationController?.navigationBar.translucent = UINavigationBar.appearance().translucent
  
}


public extension UIColor {
  convenience init(hex: String) {
    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    var alpha: CGFloat = 1.0
    var hex:   String = hex
    
    if hex.hasPrefix("#") {
      let index   = hex.startIndex.advancedBy(1)
      hex         = hex.substringFromIndex(index)
    }
    
    let scanner = NSScanner(string: hex)
    var hexValue: CUnsignedLongLong = 0
    if scanner.scanHexLongLong(&hexValue) {
      switch (hex.characters.count) {
      case 3:
        red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
        green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
        blue  = CGFloat(hexValue & 0x00F)              / 15.0
      case 4:
        red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
        green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
        blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
        alpha = CGFloat(hexValue & 0x000F)             / 15.0
      case 6:
        red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
        green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
        blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
      case 8:
        red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
        green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
        blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
        alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
      default:
        print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
      }
    } else {
      print("Scan hex error")
    }
    self.init(red:red, green:green, blue:blue, alpha:alpha)
  }
}
 extension Array {
  func take(x:Int) -> Array{
    if(self.count < x  || x <= 0){
      return self
    }else{
      return Array(self.dropLast(self.count - x))
    }
  }
  
  public func mapWithIndex<T> (f: (Int, Element) -> T) -> [T] {
    return zip((self.startIndex ..< self.endIndex), self).map(f)
  }
  
  func toDictionary<K,V>(
    transformer: (element: Element) -> (key: K, value: V)?) -> Dictionary<K, V>
  {
    return self.reduce([:]) {
      (var dict, e) in
      if let (key, value) = transformer(element: e)
      {
        dict[key] = value
      }
      return dict
    }
  }
}
extension Dictionary {
  mutating func merge<K, V>(dict: [K: V]){
    for (k, v) in dict {
      self.updateValue(v as! Value, forKey: k as! Key)
    }
  }
  
}
