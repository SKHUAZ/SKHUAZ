//
//  BaseViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import UIKit

import SnapKit
import Then

final class BaseViewController: UIViewController {
    
    // MARK: - UI Components
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension BaseViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .blue
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
