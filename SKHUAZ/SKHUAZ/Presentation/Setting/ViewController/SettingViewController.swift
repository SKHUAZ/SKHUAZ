//
//  SettingViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/15.
//

import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let rootView = SettingView()

    // MARK: - Properties
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = rootView
    }
}

extension SettingViewController {
    
    // MARK: - UI Components Property
    
    // MARK: - Layout Helper
    
    
    // MARK: - Methods

    
    // MARK: - @objc Methods
}
