//
//  UIView++.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
//    뷰의 왼쪽 상단 모서리
//   public static var layerMinXMinYCorner: CACornerMask { get }
//    뷰의 오른쪽 상단 모서리
//    public static var layerMaxXMinYCorner: CACornerMask { get }
//    뷰의 왼쪽 하단 모서리
//    public static var layerMinXMaxYCorner: CACornerMask { get }
//    뷰의 오른쪽 하단 모서리
//    public static var layerMaxXMaxYCorner: CACornerMask { get }
}
