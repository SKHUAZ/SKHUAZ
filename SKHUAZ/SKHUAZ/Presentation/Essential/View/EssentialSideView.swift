//
//  EssentialSideView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/13.
//


import UIKit

import Then
import SnapKit

enum SemesterType {
    case sophomoreSpring
    case sophomoreFall
    case juniorSpring
    case juniorFall
    case seniorSpring
    case seniorFall
}

class EssentialSideView: UIView {
    
    // MARK: - Properties
        
    // MARK: - UI Components
    
    private let topLogo = UIImageView()
    private let semesterView = UIView()
    private let semesterLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EssentialSideView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        backgroundColor = UIColor(hex: "#FFFFFF")
        
        topLogo.do {
            $0.image = Image.Logo1
        }
        
        semesterView.do {
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        
        semesterLabel.do {
            $0.text = "0학년 0학기"
            $0.textAlignment = .center
            $0.textColor = UIColor(hex: "#FFFFFF")
            $0.font = .systemFont(ofSize: 11)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        semesterView.addSubviews(semesterLabel)
        addSubviews(topLogo, semesterView)
        
        semesterLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.centerX.equalToSuperview()
        }
        
        topLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(68)
            $0.leading.equalToSuperview().offset(9)
            $0.width.equalTo(105)
            $0.height.equalTo(24)
        }
        
        semesterView.snp.makeConstraints {
            $0.top.equalTo(topLogo.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.equalTo(127)
            $0.height.equalTo(27)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}
