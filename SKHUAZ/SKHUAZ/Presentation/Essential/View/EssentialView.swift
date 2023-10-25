//
//  EssentialView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/12.
//


import UIKit

import Then
import SnapKit


enum TestType {
    case user
    case admin
}

class EssentialView: UIView {
    
    // MARK: - UI Components
    
    private let listButton = UIButton()
    private let tutorialButton = UIButton()
    private let titleLabel = UILabel()
    private let mainLectureLabel = UILabel()
    private let essentialLectureLabel = UILabel()
    private let professorNameLabel = UILabel()
    private let mainContainer = UIScrollView()
    private let contentView = UIView()
    private let mainTitleSpace = UIView()
    private let mainTitleLabel = UILabel()
    private let lectureContainer = UIStackView()
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    var listButtonHandler: (() -> Void)?
    var saveButtonHandler: (() -> Void)?
    var adminButtonHandler: (() -> Void)?
    private var essentialDataModel: [[EssentialDataModel]] = []
    private var selectedLectures: [EssentialDataModel] = []
    private var currentIndex: Int = 0 // 현재 표시 중인 배열의 인덱스
    private var lectureButtons: [LectureButton] = []
    private let essentialType: TestType
    private var allEssentialDataModels: [AllEssentialDataModel] = []
    
    
    // MARK: - Initializer
    
    init(frame: CGRect, essentialType: TestType) {
        self.essentialType = essentialType
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAddTarget()

        loadEssentialData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EssentialView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        switch essentialType {
        case .user:
            listButton.do {
                $0.setImage(Image.list, for: .normal)

            }
            
            tutorialButton.do {
                $0.setImage(Image.questionmark, for: .normal)
                $0.addTarget(self, action: #selector(openTurotial), for: .touchUpInside)
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
                $0.alwaysBounceVertical = true
                $0.showsVerticalScrollIndicator = false
                $0.showsHorizontalScrollIndicator = false
            }
            
            mainTitleSpace.do {
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
            
            mainTitleLabel.do {
                $0.text = "학기별 개설과목"
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
        case .admin:
            
            listButton.do {
                $0.setImage(Image.list, for: .normal)

            }
            
            titleLabel.do {
                $0.text = "선수과목제도 확인 및 수정"
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 20)
            }
            
            
            mainContainer.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
                $0.alwaysBounceVertical = true
                $0.showsVerticalScrollIndicator = false
                $0.showsHorizontalScrollIndicator = false
            }
            
            mainTitleSpace.do {
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
            
            mainTitleLabel.do {
                $0.text = "학기별 개설과목"
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
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        switch essentialType {
            
        case .user:
            
            addSubviews(listButton, tutorialButton, titleLabel, mainTitleSpace, mainContainer, leftButton, rightButton, saveButton)
            mainContainer.addSubviews(contentView)
            mainTitleSpace.addSubviews(
                mainTitleLabel
            )
            contentView.addSubviews(lectureContainer)
            
            
            listButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.leading.equalToSuperview().offset(22)
                $0.width.height.equalTo(23)
            }
            
            tutorialButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.trailing.equalToSuperview().inset(22)
                $0.width.height.equalTo(23)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.centerX.equalToSuperview()
            }
            
            mainTitleSpace.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(18)
                $0.leading.trailing.equalToSuperview().inset(22)
                $0.height.equalTo(37)
            }
            
            mainTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
        
            
            mainContainer.snp.makeConstraints {
                $0.top.equalTo(mainTitleSpace.snp.bottom)
                $0.leading.trailing.equalToSuperview().inset(22)
                $0.height.equalTo(563)
            }


            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(mainContainer)
                $0.height.equalTo(800)
            }


            lectureContainer.snp.makeConstraints {
                $0.top.equalTo(contentView.snp.top).offset(12)
                $0.leading.trailing.equalToSuperview().inset(10)
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
            
        case .admin:
            
            addSubviews(listButton, titleLabel, mainTitleSpace, mainContainer, leftButton, rightButton, saveButton)
            mainContainer.addSubviews(contentView)
            mainTitleSpace.addSubviews(
                mainTitleLabel
            )
            contentView.addSubviews(lectureContainer)
                        
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.centerX.equalToSuperview()
            }
            
            mainTitleSpace.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(18)
                $0.leading.trailing.equalToSuperview().inset(22)
                $0.height.equalTo(37)
            }
            
            mainTitleLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
        
            
            mainContainer.snp.makeConstraints {
                $0.top.equalTo(mainTitleSpace.snp.bottom)
                $0.leading.trailing.equalToSuperview().inset(22)
                $0.height.equalTo(563)
            }
            
            saveButton.snp.makeConstraints {
                $0.top.equalTo(mainContainer.snp.bottom).offset(9)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(83)
                $0.height.equalTo(39)
            }


            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(mainContainer)
                $0.height.equalTo(1650)
            }


            lectureContainer.snp.makeConstraints {
                $0.top.equalTo(contentView.snp.top).offset(12)
                $0.leading.trailing.equalToSuperview().inset(10)
            }
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        
        switch essentialType {
        case .user:
            
            listButton.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
            saveButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
            rightButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
            leftButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
            
        case .admin:
            saveButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)

        }
    }
    
    private func loadEssentialData() {
        switch essentialType {
        case .user:
            essentialDataModel = essentialDataModels
            renderLectureButtons(forIndex: 0)
        case .admin:
            allEssentialDataModels = allEssentialDataModel
            renderAllLectureButtons()
        }
    }
    
    private func renderLectureButtons(forIndex index: Int) {
        lectureContainer.subviews.forEach { $0.removeFromSuperview() }
        lectureButtons.removeAll()

        let dataModels = essentialDataModels[index]
        
        for dataModel in dataModels {
            let lectureButton = LectureButton(lectureName: dataModel.lectureName, professorName: dataModel.professorName)
            if index == 3 {
                if dataModel.lectureName == "알고리즘" {
                    lectureButton.removeTarget(nil, action: nil, for: .allEvents)
                    lectureButton.addTarget(self, action: #selector(openWarringAlert), for: .touchUpInside)
                }
                else {
                    lectureButton.removeTarget(self, action: #selector(openWarringAlert), for: .touchUpInside)
                }
            }
            lectureContainer.addArrangedSubview(lectureButton)
            lectureButtons.append(lectureButton)
            lectureButton.snp.makeConstraints { make in
                make.height.equalTo(38)
            }
        }
    }
    
    private func renderAllLectureButtons() {
        lectureContainer.subviews.forEach { $0.removeFromSuperview() }
        
        for dataModel in allEssentialDataModels {
            let lectureButton = LectureButton(lectureName: dataModel.lectureName, professorName: dataModel.professorName)
            
            lectureContainer.addArrangedSubview(lectureButton)
            
            lectureButton.snp.makeConstraints { make in
                make.height.equalTo(38)
                // 다른 제약조건 설정 가능
            }
            
            // 버튼에 대한 추가 작업 수행 가능
            
        }
        
    }

    
    // MARK: - @objc Methods
    
    @objc
    private func buttonTap(_ sender: UIButton) {
        
        if sender == saveButton {
            switch essentialType {
            case .user:
                saveButtonHandler?()
            case .admin:
                adminButtonHandler?()
            }
            
        }
        
        if sender == rightButton {
            print("다음 배열의 데이터가 표시됩니다")
            
            let unselectedModels = lectureButtons.filter { !$0.isSelected }.map { EssentialDataModel(lectureName: $0.lectureName, professorName: $0.professorName) }
            
            currentIndex += 1
            
            if currentIndex >= essentialDataModels.count {
                currentIndex = 0
                essentialDataModels.append([])
                if currentIndex < essentialDataModels.count {
                    essentialDataModels[currentIndex].append(contentsOf: unselectedModels)
                }
            } else {
                essentialDataModels[currentIndex].append(contentsOf: unselectedModels)
            }
            
            renderLectureButtons(forIndex: currentIndex)
        }
    }
    
    @objc func openTurotial() {
        let customAlertVC = TutorialEssentialViewController()
        customAlertVC.modalPresentationStyle = .overFullScreen
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first,
           let rootViewController = keyWindow.rootViewController {
            rootViewController.present(customAlertVC, animated: false, completion: nil)
        }
    }
    
    @objc
    private func openWarringAlert() {
        let customAlertVC = AlertViewController(alertType: .nuSelectDataStructure)
        customAlertVC.modalPresentationStyle = .overFullScreen
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first,
           let rootViewController = keyWindow.rootViewController {
            rootViewController.present(customAlertVC, animated: false, completion: nil)
        }
    }
    
    @objc
    private func openSideMenu() {
        listButtonHandler?()
    }
}
