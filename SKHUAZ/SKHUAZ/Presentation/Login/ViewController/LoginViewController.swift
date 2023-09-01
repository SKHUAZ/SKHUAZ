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
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    override func loadView() {
        self.view = rootView
    }
}

extension LoginViewController {
    
    //MARK: - @objc
    
    @objc
    private func setButton() {
        rootView.signUpButtonHandler  = { [weak self] in
            self?.signUpButtonDidTap()
        }
        rootView.logInButtonnHandler  = { [weak self] in
            self?.logInButtonDidTap()
        }
        rootView.forgotButtonnHandler  = { [weak self] in
            self?.forgotButtonDidTap()
        }
    }
    
    @objc
    private func signUpButtonDidTap() {

    }
    
    @objc
    private func logInButtonDidTap() {

    }
    
    @objc
    private func forgotButtonDidTap() {

    }
    
}
