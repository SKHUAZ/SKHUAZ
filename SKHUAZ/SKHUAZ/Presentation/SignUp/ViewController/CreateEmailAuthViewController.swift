//
//  CreateEmailAuthViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/20.
//
    import UIKit

    import SnapKit
    import Then

final class CreateEmailAuthViewController: UIViewController {
    
        private var email: String?
    
        // MARK: - UI Components
        
        private let titleLabel = UILabel()
        private let textField = UITextField()
        private let cancelButton = UIButton()
        private let saveButton = UIButton()
        // MARK: - Properties
                        
        // MARK: - Initializer
        
        var codeReturn: String? {
            return textField.text
        }
        
        // MARK: - View Life Cycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
            setLayout()
            addTarget()
        }
    }

    extension CreateEmailAuthViewController {
        
        // MARK: - UI Components Property
        
        private func setUI() {
            
            view.backgroundColor = UIColor(hex: "#FFFFFF")
            
            if let sheetPresentationController = sheetPresentationController {
                sheetPresentationController.preferredCornerRadius = 20
                sheetPresentationController.prefersGrabberVisible = true
                sheetPresentationController.detents = [.custom {context in
                    return 307
                }]
            }
            
            titleLabel.do {
                $0.text = "인증번호를 입력해주세요"
                $0.textColor = UIColor(hex: "#000000")
                $0.numberOfLines = 1
                $0.font = .systemFont(ofSize: 15)
                $0.textAlignment = .center
            }
            
            textField.do {
                let centeredParagraphStyle = NSMutableParagraphStyle()
                centeredParagraphStyle.alignment = .center
                $0.autocapitalizationType = .none
                $0.attributedPlaceholder = NSAttributedString(
                    string: "인증번호 입력",
                    attributes: [.paragraphStyle: centeredParagraphStyle]
                    )
                $0.textAlignment = .center
                $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
                $0.clearButtonMode = .whileEditing
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = 5
            }
            
            cancelButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#FFFFFF")
                $0.setTitle("취소", for: .normal)
                $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
            
            saveButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
        }
        
        // MARK: - Layout Helper
        
        private func setLayout() {
            view.addSubviews(titleLabel, textField, cancelButton, saveButton)
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(107)
                $0.centerX.equalToSuperview()
            }
            
            textField.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(10)
                $0.height.equalTo(50)
                $0.leading.trailing.equalToSuperview().inset(43)
            }
            
            cancelButton.snp.makeConstraints {
                $0.top.equalTo(textField.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(43)
                $0.width.equalTo(142)
                $0.height.equalTo(50)
            }
            
            saveButton.snp.makeConstraints {
                $0.top.equalTo(textField.snp.bottom).offset(20)
                $0.trailing.equalToSuperview().inset(43)
                $0.width.equalTo(142)
                $0.height.equalTo(50)
            }
        }
        
        // MARK: - Methods
        
        private func addTarget() {
            cancelButton.addTarget(self, action: #selector(dismissToCreateEvaluateViewController), for: .touchUpInside)
            saveButton.addTarget(self, action: #selector(saveEvaluate), for: .touchUpInside)
        }
        func setEmail(_ email: String) {
                self.email = email
            }
        
        // MARK: - @objc Methods
        
        @objc
        private func dismissToCreateEvaluateViewController() {
            dismiss(animated: true, completion: nil)
        }
        
        @objc
        private func saveEvaluate() {
            emailAuthCode(email: email ?? "")
        }
        
        // MARK: - API 통신
        func emailAuthCode(email: String) {
            UserAPI.shared.emailAuthCode(request: emailCodeRequest.init(email: email, code: textField.text ?? "")){ result in
                    switch result {
                    case .success:
                        print("인증이 완료되었습니다.")
                        NotificationCenter.default.post(name: NSNotification.Name("emailSignal"),
                                                                object: true)
                        self.dismiss(animated: false) { [weak self] in
                                let customAlertVC = AlertViewController(alertType: .mainEvaluate)
                                customAlertVC.modalPresentationStyle = .overFullScreen
                                UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
                            
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
    }
