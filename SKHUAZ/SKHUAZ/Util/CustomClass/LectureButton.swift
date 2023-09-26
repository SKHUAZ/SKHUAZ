//
//  LectureButton.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/14.
//

import UIKit

import Then
import SnapKit

class LectureButton: UIButton {
    
    // MARK: - UI Components
    
    private let lectureNameLabel = UILabel()
    private let professorNameLabel = UILabel()
    private var selectedLectures: [EssentialDataModel] = []
    
    // MARK: - Properties
    
    var lectureName: String {
        return lectureNameLabel.text ?? ""
    }
    
    var professorName: String {
        return professorNameLabel.text ?? ""
    }

    
    // MARK: - Initializer
    
    init(lectureName: String, professorName: String) {
        super.init(frame: .zero)
        
        setLecture(lectureName)
        setProfessor(professorName)
        setUI()
        setLayout()
        setAddTarget()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        layer.cornerRadius = 6
        backgroundColor = UIColor(hex: "#EFEFEF")
        
        lectureNameLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 11)
        }
        
        professorNameLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 11)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(lectureNameLabel, professorNameLabel)
        
        lectureNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(7)
        }
        
        professorNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(7)
        }
        
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setLecture(_ lectureName: String) {
        lectureNameLabel.text = lectureName
    }
    
    private func setProfessor(_ professorName: String) {
        professorNameLabel.text = professorName
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func buttonTapped() {
        isSelected.toggle()
        backgroundColor = isSelected ? UIColor(hex: "#9AC1D1") : UIColor(hex: "#EFEFEF")

        let lecture = EssentialDataModel(lectureName: lectureName, professorName: professorName)

        if isSelected {
            selectedLectures.append(lecture)
        } else {
            if let index = selectedLectures.firstIndex(of: lecture) {
                selectedLectures.remove(at: index)
            }
        }
    }

}
