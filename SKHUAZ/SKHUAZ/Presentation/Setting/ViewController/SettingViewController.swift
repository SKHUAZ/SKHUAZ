//
//  SettingViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/15.
//

import UIKit

final class SettingViewController: UIViewController, SettingViewDelegate {
    func editProfileButtonTapped() {
        let secondViewController = EditProfileViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    
    // MARK: - UI Components
    
    private let rootView = SettingView()

    // MARK: - Properties
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
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
