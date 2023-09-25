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
        LogIn()
//        let secondVC = BaseViewController()
//        secondVC.modalPresentationStyle = .fullScreen
//        present(secondVC, animated: true, completion: nil)
    }
    
    func signUpButtonTapped() {
        LogIn()

//        let secondVC = SignUpViewController()
//        secondVC.modalPresentationStyle = .fullScreen
//        present(secondVC, animated: true, completion: nil)
//        let secondViewController = SignUpViewController()
//                self.navigationController?.pushViewController(secondViewController, animated: true)
//            
    }
    
    
    // MARK: - UI Components
    
    private let rootView = LoginView()
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButton()
    }
    
    override func loadView() {
        self.view = rootView
        rootView.delegate = self
    }
}

extension LoginViewController {
    
    //MARK: - @objc
    
//    @objc
//    private func setButton() {
//        rootView.signUpButtonHandler  = { [weak self] in
//            self?.signUpButtonDidTap()
//        }
//        rootView.logInButtonnHandler  = { [weak self] in
//            self?.logInButtonDidTap()
//        }
//        rootView.forgotButtonnHandler  = { [weak self] in
//            self?.forgotButtonDidTap()
//        }
//    }
    
    @objc
    private func signUpButtonDidTap() {

    }
    
    @objc
    private func logInButtonDidTap() {

    }
    
    @objc
    private func forgotButtonDidTap() {

    }
    
    func LogIn() {
        LogInAPI.shared.LogIn(request: LogInRequest.init(email: rootView.emailTextFieldText ?? "", password: rootView.passwordReturn ?? "")) { result in
                switch result {
                case .success:
                    print("email send Success")
                case .requestErr(let message):
                    // Handle request error here.
                    print("Request error: \(message)")
                case .pathErr:
                    // Handle path error here.
                    print("Path error")
                case .serverErr:
                    // Handle server error here.
                    print("Server error")
                case .networkFail:
                    // Handle network failure here.
                    print("Network failure")
                default:
                    break
                }
            }
        }

    
}
