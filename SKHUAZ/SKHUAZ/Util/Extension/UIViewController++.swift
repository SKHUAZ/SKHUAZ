//
//  UIViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/06.
//

import UIKit

extension UIViewController {
    
    func setTapScreen() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func didTapScreen() {
        view.endEditing(true)
    }
}
