//
//  SettingView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/15.
//

import UIKit

import SnapKit
import Then

protocol SettingViewDelegate: AnyObject {
    func editProfileButtonTapped()
    func logOutButtonTapped()
    func signOutButtonTapped()
}

class SettingView: UIView {
    
    weak var delegate: SettingViewDelegate?

    // MARK: - UI Components
    
    private let contentScrollView = UIScrollView()
    private let mainImage = UIImageView()
    private let editProfileButton = UIButton()
    private let setAlarmButton = UIButton()
    private let setModeButton = UIButton()
    private let ruleButton = UIButton()
    private let logOutButton = UIButton()
    private let signOutButton = UIButton()
    private let rightLabel = UILabel()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        addTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        self.backgroundColor = .white

        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        editProfileButton.do {
            $0.setTitle("프로필편집", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.black.cgColor
        }
        ruleButton.do {
            $0.setTitle("이용규칙", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.black.cgColor
        }
        logOutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.black.cgColor
        }
        signOutButton.do {
            $0.setTitle("회원탈퇴", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.black.cgColor
        }
        rightLabel.do {
            $0.text = "© 2023. ( PBCH^2YM ) all right reserved"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Layout Helper

    private func setLayout() {
        
        addSubviews(mainImage, editProfileButton, ruleButton, logOutButton, signOutButton, rightLabel)
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.width.equalTo(234)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        editProfileButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(53)
            $0.top.equalTo(mainImage.snp.bottom).offset(57)
        }
        ruleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(editProfileButton.snp.bottom).offset(40)
            $0.height.equalTo(53)
        }
        logOutButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(53)
            $0.top.equalTo(ruleButton.snp.bottom).offset(40)
        }
        signOutButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(53)
            $0.top.equalTo(logOutButton.snp.bottom).offset(40)
        }
        rightLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(53)   
            $0.top.equalTo(signOutButton.snp.bottom).offset(40)
        }
    }
    
    // MARK: - Methods

    private func addTarget() {
        
        editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }

    // MARK: - @objc Methods
    
    @objc func editProfileButtonTapped() {
        delegate?.editProfileButtonTapped()
    }
    @objc func logOutButtonTapped() {
        delegate?.logOutButtonTapped()
    }
    @objc func signOutButtonTapped() {
        delegate?.signOutButtonTapped()
    }
}
