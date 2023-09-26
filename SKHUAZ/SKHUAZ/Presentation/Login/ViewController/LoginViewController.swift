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
    
    func pushToTabbarView() {
        let tabBarController = TabBarController()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate {
            delegate.window?.rootViewController = navigationController
        }
    }
    
    func logInButtonTapped() {
        LogIn()
        print("뷰야 바뀌어라 얍")
    }
    
    func signUpButtonTapped() {
        let secondVC = SignUpViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
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
        UserAPI.shared.LogIn(request: LogInRequest.init(email: rootView.emailTextFieldText ?? "", password: rootView.passwordReturn ?? "")) { result in
                switch result {
                case .success(let data):
                    if let data = data as? LogInDTO {
                        // 서버에서 받은 데이터를 LogInDTo로 매핑
                        UserDefaults.standard.set(data.accessToken, forKey: "AuthToken")
                        
                    } else {
                        print("Failed to decode the response.")
                    }
                    self.pushToTabbarView()
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
    func parseLogInResponse(data: Data) throws -> LogInDTO {
        do {
            let decoder = JSONDecoder()
            let logInDTO = try decoder.decode(LogInDTO.self, from: data)
            return logInDTO
        } catch {
            throw YourErrorType.parsingError(description: "Failed to parse LogIn response")
        }
    }
}
