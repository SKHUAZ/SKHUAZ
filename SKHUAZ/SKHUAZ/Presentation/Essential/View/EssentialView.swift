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
    
    private let listButton = UIButton()
    
    private let titleLabel = UILabel()
    
    private let mainLectureLabel = UILabel()
    private let essentialLectureLabel = UILabel()
    private let professorNameLabel = UILabel()
    
    private let mainContainer = UIView()
    private let mainTitleSpace = UIView()
    private let mainTitleLabel = UILabel()
    private let lectureContainer = UIStackView()
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    var listButtonHandler: (() -> Void)?
    private var essentialDataModel: [[EssentialDataModel]] = []
    private var selectedLectures: [EssentialDataModel] = []
    private var currentIndex: Int = 0 // 현재 표시 중인 배열의 인덱스
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()
        
        loadEssentialData()
        renderLectureButtons(forIndex: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EssentialView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        listButton.do {
            $0.setImage(Image.list, for: .normal)

        }
        
        titleLabel.do {
            $0.text = "선수과목제도 확인"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 20)
        }
        
        mainLectureLabel.do {
            $0.text = "강의명"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 13)
        }
        
        essentialLectureLabel.do {
            $0.text = "선수과목"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 13)
        }
        
        professorNameLabel.do {
            $0.text = "교수"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 13)
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
            $0.setImage(Image.leftButton, for: .normal)

        }
        
        saveButton.do {
            $0.setImage(Image.save, for: .normal)
        }
        
        rightButton.do {
            $0.setImage(Image.rightButton, for: .normal)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(listButton, titleLabel, mainContainer, leftButton, rightButton, saveButton)
        mainContainer.addSubviews(mainTitleSpace, lectureContainer)
        mainTitleSpace.addSubviews(
//            mainLectureLabel, essentialLectureLabel, professorNameLabel
            mainTitleLabel
        )
        
        mainTitleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
//        mainLectureLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalToSuperview().offset(18)
//        }
//
//        essentialLectureLabel.snp.makeConstraints {
//            $0.leading.equalTo(mainLectureLabel.snp.trailing).offset(18)
//            $0.top.equalTo(mainLectureLabel.snp.top)
//        }
//
//        professorNameLabel.snp.makeConstraints {
//            $0.trailing.equalToSuperview().inset(18)
//            $0.top.equalTo(mainLectureLabel.snp.top)
//        }

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
        listButton.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    private func loadEssentialData() {
        essentialDataModel = essentialDataModels
    }
    
    private func renderLectureButtons(forIndex index: Int) {
        lectureContainer.subviews.forEach { $0.removeFromSuperview() }

        let dataModels = essentialDataModels[index] // 현재 인덱스에 해당하는 배열 가져오기
        
        for dataModel in dataModels {
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
            // 선택한 강의 정보 출력
            for lectureButton in lectureContainer.subviews.compactMap({ $0 as? LectureButton }) {
                if lectureButton.isSelected {
                    print("Selected Lecture: \(lectureButton.lectureName), Professor: \(lectureButton.professorName)")
                }
            }
        } else if sender == rightButton {
            print("다음 배열의 데이터가 표시됩니다")
            // 다음 배열의 데이터 표시
            currentIndex += 1
            if currentIndex >= essentialDataModels.count {
                currentIndex = 0 // 인덱스가 배열 길이를 넘어갈 경우 처음 배열로 돌아갑니다.
            }
            renderLectureButtons(forIndex: currentIndex)
        } else if sender == leftButton {
            // 이전 배열의 데이터 표시
            print("이전 배열의 데이터가 표시됩니다")
            currentIndex -= 1
            if currentIndex < 0 {
                currentIndex = essentialDataModels.count - 1 // 인덱스가 음수일 경우 마지막 배열로 돌아갑니다.
            }
            renderLectureButtons(forIndex: currentIndex)
        }
    }
    
    @objc
    private func openSideMenu() {
        listButtonHandler?()
    }
}
