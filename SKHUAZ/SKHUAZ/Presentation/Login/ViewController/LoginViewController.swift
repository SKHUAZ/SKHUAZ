//
//  LoginViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/08/17.
//
import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController, LoginViewDelegate {
    
    func logInButtonTapped() {
        let secondVC = BaseViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    func signUpButtonTapped() {
//        let secondVC = SignUpViewController()
//        secondVC.modalPresentationStyle = .fullScreen
//        present(secondVC, animated: true, completion: nil)
        let secondViewController = SignUpViewController()
                self.navigationController?.pushViewController(secondViewController, animated: true)
            
    }
    
    
    // MARK: - UI Components
    
    private let rootView = LoginView()
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    override func loadView() {
        self.view = rootView
        rootView.delegate = self
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
