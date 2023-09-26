//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

final class SignUpViewController: UIViewController, SignUpViewDelegate {
    
    func nicknameCheckButtonTapped() {
        nicknameCheck()
    }
        
    func emailCheckButtonTapped() {
        if let email = rootView.emailTextFieldText {
            
                    if checkEmail(str: email) {
                        // 입력값이 유효한 이메일 주소일 경우
                        emailAuth()
                        let bottomSheetVC = CreateEmailAuthViewController()
                        bottomSheetVC.setEmail(email)
                        present(bottomSheetVC, animated: true, completion: nil)
                    }
                    else {
                        // 입력값이 유효하지 않은 이메일 주소일 경우
//                        resultLabel.text = "유효하지 않은 이메일 주소입니다."
//                        resultLabel.textColor = .red
                    }
                }
            }
    
    func signUpButtonTapped() {
//        let bottomSheetVC = CreateEmailAuthViewController()
//        present(bottomSheetVC, animated: true, completion: nil)
        SignUp()
//        print("first Value: \(rootView.firstValueReturn)")
//        print("second Value: \(rootView.secondValueReturn)")
//        print("name Value: \(rootView.nameTextFieldText)")
//        print("email Value: \(rootView.emailTextFieldText)")
//        print("nickname Value: \(rootView.nicknameTextFieldText)")
//        print("nickname Value: \(rootView.nicknameTextFieldText)")
//        print("semester Value: \(rootView.semesterButtonTitle)")
//        print("mainMajor Value: \(rootView.mainMajorButtonTitle)")
//        print("subMajor Value: \(rootView.subMajorButtonTitle)")


    }
    

    // MARK: - UI Components
    
    private let rootView = SignUpView()

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupKeyboardEvent()
    }
    
    override func loadView() {
        self.view = rootView
        rootView.delegate = self
    }
    
    // MARK: - Methods
    
    /// 이메일의 참/부정 요소를 평가하는 함수
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@office.skhu.ac.kr"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with:str)
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
    // MARK: - @objc Methods
    
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
    // MARK: - API 통신
    func SignUp() {
        UserAPI.shared.SignUp(request: SignUpRequest.init(email: rootView.emailTextFieldText ?? "", password: rootView.passwordReturn ?? "", nickname: rootView.nicknameTextFieldText ?? "", semester: rootView.semesterButtonTitle ?? "", graduate: rootView.graduateReturn ?? false, major1: rootView.mainMajorButtonTitle ?? "", major2: rootView.subMajorButtonTitle ?? "", department: rootView.departmentReturn ?? false, major_minor: rootView.majorminorReturn ?? false, double_major: rootView.doublemajorReturn ?? false)) { result in
                switch result {
                case .success:
                    print("Sign Up Success")
                    self.dismiss(animated: true)
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
    func emailAuth() {
        UserAPI.shared.emailAuth(request:emailSendRequest.init(email: rootView.emailTextFieldText ?? "")) { result in
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
    func nicknameCheck() {
        UserAPI.shared.nicknameCheck(nickname: rootView.nicknameTextFieldText ?? "") { result in
                switch result {
                case .success:
                    print("nickname checked Success")
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

