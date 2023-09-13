//
//  EssentialView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/12.
//


import UIKit

import Then
import SnapKit

class EssentialView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let mainContainer = UIView()
    private let mainTitleLabel = UILabel()
    private let lectureContainer = UIView()
    private let lectureTitle = UILabel()
    private let lectureProfessor = UILabel()
    
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

extension EssentialView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
        }
        
        mainTitleLabel.do {
            $0.text = "0학년 0학기 개설과목"
            $0.textColor = UIColor(hex: "#FFFFFF")
            $0.font = .systemFont(ofSize: 13)
            $0.textAlignment = .center
            $0.backgroundColor = UIColor(hex: "#000000")
            $0.layer.cornerRadius = 6
        }
        
        lectureContainer.do {
            $0.layer.cornerRadius = 6
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
        }
        
        lectureTitle.do {
            $0.text = "C++ 프로그래밍"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 13)
        }
        
        lectureProfessor.do {
            $0.text = "임충규"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 13)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(mainContainer)
        mainContainer.addSubviews(mainTitleLabel, lectureContainer)
        lectureContainer.addSubviews(lectureTitle, lectureProfessor)
        
        lectureTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(18)
        }
        
        lectureProfessor.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        mainContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
//            $0.height.equalTo(718)
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(37)
        }
        
        lectureContainer.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(38)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}
