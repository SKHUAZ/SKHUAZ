//
//  UIStackView++.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
