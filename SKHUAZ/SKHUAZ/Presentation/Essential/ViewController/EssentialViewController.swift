//
//  EssentialViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/12.
//

import UIKit

import SnapKit
import Then

final class EssentialViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let listButton = UIButton()
    private let titleLabel = UILabel()
    private let essentialView = EssentialView()
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension EssentialViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        listButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
        }
        
        titleLabel.do {
            $0.text = "선수과목제도 확인"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 20)
        }
        
        leftButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
        }
        
        rightButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(listButton, titleLabel, essentialView, leftButton, saveButton, rightButton)
        
        listButton.snp.makeConstraints {
            $0.top.equalTo(additionalSafeAreaInsets).offset(60)
            $0.leading.equalToSuperview().offset(22)
            $0.width.height.equalTo(23)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(additionalSafeAreaInsets).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        essentialView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(600)
        }
        
        leftButton.snp.makeConstraints {
            $0.top.equalTo(essentialView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(89)
            $0.width.height.equalTo(39)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(essentialView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.equalTo(essentialView.snp.bottom).offset(9)
            $0.trailing.equalToSuperview().inset(89)
            $0.width.height.equalTo(39)
        }
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
