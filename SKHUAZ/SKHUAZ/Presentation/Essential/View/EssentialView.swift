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
    
    // MARK: - UI Components
    
    let listButton = UIButton()

    private let titleLabel = UILabel()
    
    private let mainContainer = UIView()
    private let mainTitleSpace = UIView()
    private let mainTitleLabel = UILabel()
    private let lectureContainer = UIStackView()
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    private var essentialDataModel: [EssentialDataModel] = []
    private var selectedLectures: [EssentialDataModel] = []

    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
        
        loadEssentialData()
        renderLectureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EssentialView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
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
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        mainTitleSpace.do {
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        
        mainTitleLabel.do {
            $0.text = "0학년 0학기 개설과목"
            $0.textColor = UIColor(hex: "#FFFFFF")
            $0.font = .systemFont(ofSize: 13)
            $0.textAlignment = .center
        }
        
        lectureContainer.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        
        leftButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            $0.layer.borderWidth = 1
        }
        
        saveButton.do {
            $0.setImage(Image.save, for: .normal)
        }
        
        rightButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(listButton, titleLabel, mainContainer, leftButton, rightButton, saveButton)
        mainContainer.addSubviews(mainTitleSpace, lectureContainer)
        mainTitleSpace.addSubviews(mainTitleLabel)
        
        mainTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        mainTitleSpace.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(37)
        }
        
        lectureContainer.snp.makeConstraints {
            $0.top.equalTo(mainTitleSpace.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(22)
            $0.width.height.equalTo(23)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        
        
        mainContainer.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(600)
        }
        
        leftButton.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.bottom).offset(9)
            $0.trailing.equalTo(saveButton.snp.leading).offset(-30)
            $0.width.height.equalTo(39)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.bottom).offset(9)
            $0.leading.equalTo(saveButton.snp.trailing).offset(30)
            $0.width.height.equalTo(39)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        listButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    private func loadEssentialData() {
        essentialDataModel = essentialDataModels
    }
    
    private func renderLectureButtons() {
        lectureContainer.subviews.forEach { $0.removeFromSuperview() }
        
        for dataModel in essentialDataModel {
            let lectureButton = LectureButton(lectureName: dataModel.lectureName, professorName: dataModel.professorName)
            
            lectureContainer.addArrangedSubview(lectureButton)
            
            lectureButton.snp.makeConstraints { make in
                make.height.equalTo(38)
            }
        }
    }
    
    // MARK: - @objc Methods
    
    @objc
     private func buttonTap(_ sender: UIButton) {
         if sender == saveButton {
             print("Selected Lectures:")
             for lecture in selectedLectures {
                 print("Lecture Name:", lecture.lectureName)
                 print("Professor Name:", lecture.professorName)
                 print("---")
             }
             print("Save button tapped!")
             
         } else {
             print("Other button tapped!")
             
         }
     }
}
