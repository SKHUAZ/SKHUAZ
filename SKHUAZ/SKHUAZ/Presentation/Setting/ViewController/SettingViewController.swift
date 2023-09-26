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
    
    func pushToLogInView() {
        let secondViewController = LoginViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func editProfileButtonTapped() {
        let secondViewController = EditProfileViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    func logOutButtonTapped() {
        logOut()
    }
    
    func signOutButtonTapped() {
        signOut()
    }
    
    func logOut() {
        LogInAPI.shared.LogOut(token: token) { result in
            switch result {
            case .success:
                print("로그아웃했대요")
                self.pushToLogInView()
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
        LogInAPI.shared.signOut(token: token) { result in
            switch result {
            case .success:
                print("회원탈퇴완료")
                self.pushToLogInView()
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
        // MARK: - @objc Methods
}
