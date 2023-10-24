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
                        NotificationCenter.default.addObserver(self,
                                                                       selector: #selector(dataReceived),
                                                                       name: NSNotification.Name("emailSignal"),
                                                                       object: nil)
                        let bottomSheetVC = CreateEmailAuthViewController()
                        bottomSheetVC.setEmail(email)
                        present(bottomSheetVC, animated: true, completion: nil)
                    }
                    else {
                        print("Invalid Email")
                    }
                }
            }
    
    func signUpButtonTapped() {
        SignUp()
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
        UserAPI.shared.SignUp(request: SignUpRequest.init(email: rootView.emailTextFieldText ?? "", password: rootView.passwordReturn ?? "", nickname: rootView.nicknameTextFieldText ?? "", semester: rootView.semesterButtonTitle ?? "", graduate: rootView.graduateReturn ?? false, major1: rootView.mainMajorButtonTitle ?? "", major2: rootView.subMajorButtonTitle ?? "", department: rootView.departmentReturn ?? false, majorMinor: rootView.majorminorReturn ?? false, doubleMajor: rootView.doublemajorReturn ?? true)) { result in
                switch result {
                case .success:
                    print("signup")
                    self.navigationController?.popViewController(animated: true)
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
                    print("email")
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
                case .success(let data):
                    if let successData = data as? NicknameCheckDTO  {
                        if successData.statusCode == 200{
                            self.rootView.nicknameWarningMessageReturn?.textColor = .blue
                            self.rootView.nicknameWarningMessageReturn?.text = "닉네임 인증 성공 *"
                            self.rootView.nicknameWarningMessageReturn?.isHidden = false
                        }
                    }
                case .requestErr(let data):
                    if let failData = data as? ErrorDTO  {
                        if failData.statusCode == 409 {
                            self.rootView.nicknameWarningMessageReturn?.textColor = .red
                            self.rootView.nicknameWarningMessageReturn?.text = "닉네임 중복 *"
                            self.rootView.nicknameWarningMessageReturn?.isHidden = false
                        }
                    }
                case .pathErr:
                    // Handle path error here.
                    print("Path error")
                case .serverErr:
                    // Handle server error here.
                    print("Server error")
                case .networkFail:
                    // Handle network failure here.
                    print("Network failure")
                case .decodedErr:
                    print("decoding Error")
                default:
                    break
                }
            }
        }
    @objc
        func dataReceived(notification: NSNotification) {
            
            guard let emailValid = notification.object as? Bool else { return }
            if emailValid{
                self.rootView.emailWarningMessageReturn?.isHidden = false
                self.rootView.emailWarningMessageReturn?.textColor = .blue
                self.rootView.emailWarningMessageReturn?.text = "인증 완료 *"
            }
            else {
                
            }
        }
}

