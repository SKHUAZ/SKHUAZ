//
//  CustomColor.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/08/30.
//
import UIKit

enum AssetsColor {
  // placeHolderBackgroundColor
  case placeHolderBackgroundColor
    
  // placeHolderColor
  case placeHolderColor
  
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .placeHolderBackgroundColor:
      return #colorLiteral(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
    case .placeHolderColor:
      return #colorLiteral(red: 0.45, green: 0.45, blue: 0.45, alpha: 1)
    }
  }
}
