//
//  ColorNotifyView.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/29/23.
//

import UIKit

import Then
import SnapKit

class ColorNotifyView: UIView {
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let boxTask = UIView()
    private let labelTask = UILabel()
    private let boxPractice = UIView()
    private let labelPractice = UILabel()
    private let boxPresentation = UIView()
    private let labelPresentation = UILabel()
    private let boxTeamPlay = UIView()
    private let labelTeamPlay = UILabel()
    
    
    
    
    // MARK: - Properties

    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
extension ColorNotifyView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        
        boxTask.do {
            $0.backgroundColor = UIColor(hex: "#0C276A")
        }
        
        labelTask.do {
            $0.text = "과제량"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        boxPractice.do {
            $0.backgroundColor = UIColor(hex: "#4678C6")
        }
        
        labelPractice.do {
            $0.text = "실습량"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        boxPresentation.do {
            $0.backgroundColor = UIColor(hex: "#DAE1E9")
        }
        
        labelPresentation.do {
            $0.text = "발표량"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        boxTeamPlay.do {            
            $0.backgroundColor = UIColor(hex: "#ACC3E5")
        }
        
        labelTeamPlay.do {
            $0.text = "팀플 횟수"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(boxTask, labelTask, boxPractice,
                    labelPractice ,boxPresentation, labelPresentation
                    ,boxTeamPlay, labelTeamPlay)

        boxTask.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        labelTask.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(boxTask.snp.trailing).offset(5)
        }
        
        boxPractice.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(labelTask.snp.trailing).offset(10)
        }
        
        labelPractice.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(boxPractice.snp.trailing).offset(5)
        }
        
        boxPresentation.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(labelPractice.snp.trailing).offset(10)
        }
        
        labelPresentation.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(boxPresentation.snp.trailing).offset(5)
        }
        
        boxTeamPlay.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(labelPresentation.snp.trailing).offset(10)
        }
        
        labelTeamPlay.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(boxTeamPlay.snp.trailing).offset(5)
        }
    }
    
}
