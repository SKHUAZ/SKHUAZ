//
//  LoginView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/08/17.
//

import UIKit

import SnapKit
import Then

protocol LoginViewDelegate: AnyObject {
    func logInButtonTapped()
    func signUpButtonTapped()
}

final class LoginView: UIView {
    
    // MARK: - GETTER
    
    var emailTextFieldText: String? {
        return idTextField.text
    }
    var passwordReturn: String? {
        return pwTextField.text
    }
    // MARK: - UI Components
    
    private let mainImage = UIImageView()
    private let idTextField = UITextField()
    private let pwTextField = UITextField()
    private let logInButton = UIButton()
    private let signUpButton = UIButton()
    
    // MARK: - Properties
        
    var signUpButtonHandler: (() -> Void)?
    var forgotButtonnHandler: (() -> Void)?
    var logInButtonnHandler: (() -> Void)?
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        self.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }

        idTextField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "학번을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.appColor(.placeHolderColor)]) // Placeholder 텍스트 색상 설정
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        pwTextField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.appColor(.placeHolderColor)]) // Placeholder 텍스트 색상 설정
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }

        logInButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .black
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self,
                             action: #selector(logInButtonTapped),
                             for: .touchUpInside)
            $0.layer.cornerRadius = 5
        }
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 11)
            $0.setTitleColor(.gray, for: .normal)
            $0.addTarget(self,
                         action: #selector(signUpButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(mainImage, idTextField, pwTextField,
                    logInButton, signUpButton)
        
        mainImage.snp.makeConstraints {
            $0.bottom.equalTo(idTextField.snp.top).offset(-50)
            $0.trailing.leading.equalToSuperview().inset(50)
        }
        
        idTextField.snp.makeConstraints {
            $0.bottom.equalTo(pwTextField.snp.top).offset(-30)
            $0.trailing.leading.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        pwTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        logInButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(30)
            $0.trailing.leading.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(logInButton.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(13)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
    @objc
    func logInButtonTapped() {
        self.delegate?.logInButtonTapped()
    }
    @objc
    func signUpButtonTapped() {
        self.delegate?.signUpButtonTapped()
    }
}
