//
//  SettingViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/15.
//

import UIKit

final class SettingViewController: UIViewController, SettingViewDelegate {
    
    // MARK: - UI Components
        
    private let rootView = SettingView()

    // MARK: - Properties
        
    var token: String = UserDefaults.standard.string(forKey: "AuthToken")!
    
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
    
    func editProfileButtonTapped() {
        let secondViewController = EditProfileViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func logOutButtonTapped() {
        logOut()
    }
    
    func signOutButtonTapped() {
        signOut()
    }
    
    func logOut() {
        UserAPI.shared.LogOut(token: token) { result in
            switch result {
            case .success:
                print("로그아웃했대요")
                self.pushToLoginView()
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
    func signOut() {
        UserAPI.shared.signOut(token: token) { result in
            switch result {
            case .success(let data):
                if let data = data as? SignOutDTO{
                    print("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️")
                    self.pushToLoginView()
                } else {
                    print("🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍")
                }
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
    func pushToLoginView() {
            let loginVC = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowScene.delegate as? SceneDelegate {
                delegate.window?.rootViewController = navigationController
            }
        }
    
        // MARK: - @objc Methods
}
