//
//  importRootTableViewCell.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/13.
//

import UIKit

import Then
import SnapKit

class importRootTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    private let recommendListContainer = UIView()
    private let mainContainer = UIStackView() //루트추천 본문 컨테이너
    private let topSpace = UIView()
    
    private let recommendContent = UILabel()
    private let courseYear = UILabel()
    private var recommendDataModel: [RecommendDataModel] = []
    private var currentIndex: Int = 0 // 현재 표시 중인 배열의 인덱스
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
        selectedBackgroundView = UIView()
//        loadEssentialData()
        renderLectureContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension importRootTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        recommendListContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray.cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        mainContainer.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        
        courseYear.do {
            $0.font = .systemFont(ofSize: 12, weight: .bold)
            $0.textColor = .white
        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
        
        contentView.addSubviews(recommendListContainer)
        recommendListContainer.addSubviews(topSpace, mainContainer)
        
        topSpace.addSubviews(courseYear)
        
        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(147)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(25)
        }
        
        courseYear.snp.makeConstraints {
            $0.centerX.equalTo(topSpace)
            $0.centerY.equalTo(topSpace)
        }
        
        mainContainer.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.greaterThanOrEqualTo(38)  // 여기서 38은 CustomRootContainer의 높이입니다.
        }
    }
    
    //MARK: - configure
    
    func importRootModelConfigure(with review: RecommendDataModel) {
        courseYear.text = review.courseYearLabel
    }
    
    //    private func loadEssentialData() {
    //        recommendDataModel = recommendList
    //    }
    
    private func renderLectureContainer() {
        mainContainer.subviews.forEach { $0.removeFromSuperview() }
        
        let dataModels = recommendList[0].lectureNameLabel // 현재 인덱스에 해당하는 배열 가져오기
        for lectures in dataModels {
            let lectureContainers = UIStackView()
            lectureContainers.axis = .vertical
            lectureContainers.spacing = 10
            for lecture in lectures {
                let lectureContainer = CustomRootContainer(lectureName: lecture)
                lectureContainers.addArrangedSubview(lectureContainer)
                
                lectureContainer.snp.makeConstraints { make in
                    make.height.equalTo(38)
                }
            }
            mainContainer.addArrangedSubview(lectureContainers)
        }
        
    }
}
