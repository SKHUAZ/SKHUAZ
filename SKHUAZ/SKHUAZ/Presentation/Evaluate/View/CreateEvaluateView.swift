//
//  CreateEvaluateView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/26.
//

import UIKit

import Then
import SnapKit

class CreateEvaluateView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let mainImage = UIImageView()
    private let mainContainer = UIView()
    private let topSpace = UIView()
    private let topLabel = UILabel()
    private let warringLabel = UILabel()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
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

extension CreateEvaluateView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        topLabel.do {
            $0.text = "강의평"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
        
        cancelButton.do {
            $0.setTitle("목록", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
        
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(mainContainer, topSpace,
                    cancelButton, saveButton)
        topSpace.addSubviews(topLabel)
        
        topLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(9)
        }
        
        mainContainer.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(600)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(37)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(mainContainer.snp.bottom).offset(41)
            $0.width.equalTo(77)
            $0.height.equalTo(30)
        }
        
        saveButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(mainContainer.snp.bottom).offset(41)
            $0.width.equalTo(77)
            $0.height.equalTo(30)

        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        
    }
    
    // MARK: - @objc Methods
    
}
