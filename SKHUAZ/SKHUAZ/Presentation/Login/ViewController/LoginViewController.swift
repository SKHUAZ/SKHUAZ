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
        let secondViewController = SignUpViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    
    // MARK: - UI Components
    
    private let rootView = LoginView()
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardEvent()
    }
    
    override func loadView() {
        self.view = rootView
        rootView.delegate = self
    }
}

extension LoginViewController {
    
    //MARK: - @objc
    
    @objc
    private func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentResponder as? UITextField else { return }
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let keyboardOverlap = textFieldBottomY - keyboardTopY
            view.frame.origin.y = -keyboardOverlap - 40
        }
    }
    
    @objc
    private func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
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
    
    private func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func LogIn() {
        UserAPI.shared.LogIn(request: LogInRequest.init(email: rootView.emailTextFieldText ?? "", password: rootView.passwordReturn ?? "")) { result in
                switch result {
                case .success(let data):
                    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️")
                    if let data = data as? LogInDTO {
                        // 서버에서 받은 데이터를 LogInDTo로 매핑
                        UserDefaults.standard.set(data.accessToken, forKey: "AuthToken")
                        UserDefaults.standard.set(self.rootView.emailTextFieldText ?? "", forKey: "LoginEmail")
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
