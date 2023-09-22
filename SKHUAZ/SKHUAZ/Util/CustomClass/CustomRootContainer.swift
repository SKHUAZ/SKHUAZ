//
//  CustomRootContainer.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/20.
//

import UIKit

import Then
import SnapKit

class CustomRootContainer: UIView {
    
    // MARK: - UI Components
    
    private let lectureNameLabel = UILabel()
//    private let professorNameLabel = UILabel()
    
    // MARK: - Properties
    
    var lectureName: String {
        return lectureNameLabel.text ?? ""
    }

    
    // MARK: - Initializer
    
    init(lectureName: String) {
        super.init(frame: .zero)
        
        setLecture(lectureName)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        layer.cornerRadius = 6
        backgroundColor = UIColor(hex: "#EFEFEF")
        
        lectureNameLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 14)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(lectureNameLabel)
        
        lectureNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
//        professorNameLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.trailing.equalToSuperview().inset(7)
//        }
        
    }
    
    // MARK: - Methods
    
    private func setLecture(_ lectureName: String) {
        lectureNameLabel.text = lectureName
    }
    
//    private func setProfessor(_ professorName: String) {
//        professorNameLabel.text = professorName
//    }
}
