//
//  UIStackView++.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/08/26.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
