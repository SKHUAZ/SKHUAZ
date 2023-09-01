//
//  LoginViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/08/17.
//
import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let rootView = LoginView()
    
    // MARK: - Properties
        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = rootView
    }
}

extension LoginViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        // MARK: - Methods
        
        // MARK: - @objc Methods
    }
}
