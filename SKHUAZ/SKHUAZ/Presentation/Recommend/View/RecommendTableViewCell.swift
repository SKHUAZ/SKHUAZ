//
//  RecommendTableView.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/08/22.
//

import UIKit

import Then
import SnapKit

class RecommendTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    private let recommendListContainer = UIView()
    private let mainContainer = UIView() //루트추천 본문 컨테이너
    private let topSpace = UIView()
    
    private let rightContainer1 = UILabel()
    private let rightContainer2 = UILabel()
    private let rightContainer3 = UILabel()
    private let recommendContent = UILabel()
    private let recommendTitle = UILabel()
    
    private let nickname = UILabel()
    private let courseYear = UILabel()
    private let titleLabel = UILabel()
    private let majorNameLabel = UILabel()
    private let creationDateLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
        selectedBackgroundView = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension RecommendTableViewCell {
    
    // MARK: - UI Components Property
        
    private func setUI() {
        
        recommendListContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        // 이것도 테이블뷰로 간단하게 할 수 있을듯
        rightContainer1.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        rightContainer2.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        rightContainer3.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        recommendTitle.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .white
            $0.backgroundColor = .black
        }

        majorNameLabel.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
        }
        
        recommendContent.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
        }

    }
    
    // MARK: - Layout Helper
    
    func setLayout() {

        
        contentView.addSubviews(recommendListContainer)
        recommendListContainer.addSubviews(topSpace, mainContainer, rightContainer1, rightContainer2, rightContainer3)
        
        topSpace.addSubviews(recommendTitle)
        
        mainContainer.addSubview(recommendContent)
        rightContainer1.addSubview(majorNameLabel)
        rightContainer2.addSubview(majorNameLabel)
        rightContainer3.addSubview(majorNameLabel)
        
        
        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(36)
            $0.width.equalTo(315)
            $0.height.equalTo(147)
        }
        
        recommendTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        mainContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.width.equalTo(150)
            $0.height.equalTo(105)
        }
        
        rightContainer1.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(130)
            $0.height.equalTo(28)
        }
        
        rightContainer2.snp.makeConstraints {
            $0.top.equalTo(rightContainer1.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(130)
            $0.height.equalTo(28)
        }
        
        rightContainer3.snp.makeConstraints {
            $0.top.equalTo(rightContainer2.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(130)
            $0.height.equalTo(28)
        }
        
        recommendContent.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
        }
        
        majorNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
        }
        
//        content.snp.makeConstraints {
//            $0.top.equalTo(topSpace.snp.bottom).offset(10)
//            $0.trailing.equalToSuperview().inset(19)
//            $0.width.height.equalTo(104)
//        }
    }
    
    //MARK: - configure
    
    func configure(with review: RecommendDataModel) {
        recommendTitle.text = review.titleLabel
        titleLabel.text = review.titleLabel
        majorNameLabel.text = review.majorNameLabel
        nickname.text = review.nickNameLabel
        courseYear.text = review.courseYearLabel
        recommendContent.text = review.contentLabel
    }
    
//    //MARK: - make LectureBox
//    func lectureBox() {
//
//    }
        
}
