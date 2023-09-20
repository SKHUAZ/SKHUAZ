//
//  EditProfileViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/17.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let rootView = EditProfileView()

    // MARK: - Properties
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        rootView.delegate = self
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
