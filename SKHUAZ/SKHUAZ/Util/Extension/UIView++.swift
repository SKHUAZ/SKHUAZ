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
}
