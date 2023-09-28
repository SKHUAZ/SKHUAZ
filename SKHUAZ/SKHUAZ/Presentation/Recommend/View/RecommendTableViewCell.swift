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
    private let lectureContainer1 = UIView()
    private let lectureContainer2 = UIView()
    private let lectureContainer3 = UIView()
    
    private let recommendSubListView = UITableView()
        
    private let recommendContent = UILabel()
    private let recommendTitle = UILabel()
    
    private let nickname = UILabel()
//    private let courseYear = UILabel()
    private let titleLabel = UILabel()
    private let lectureNameLabel = UILabel()
    private let majorNameLabel = UILabel()
    private let majorNameLabel2 = UILabel()
    private let majorNameLabel3 = UILabel()
    private let creationDateLabel = UILabel()
//    var reviewList: [RecommendDataModel] = []
    
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
        
        recommendSubListView.do {
            $0.separatorStyle = .none
            $0.register(RecommendTableViewCell.self, forCellReuseIdentifier: "Cell")
        }
        
        recommendListContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        lectureContainer1.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        lectureContainer2.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        lectureContainer3.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
        }
        
        recommendTitle.do {
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .white
        }
        
        creationDateLabel.do {
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .white
        }

        majorNameLabel.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.text = "자바프로그래밍"
        }
        
        majorNameLabel2.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.text = "자료구조"
        }
        
        majorNameLabel3.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.text = "알고리즘"
        }
        
        recommendContent.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.numberOfLines = 0
        }

    }
    
    // MARK: - Layout Helper
    
    func setLayout() {

        
        contentView.addSubviews(recommendListContainer)
        recommendListContainer.addSubviews(topSpace, mainContainer, lectureContainer1, lectureContainer2, lectureContainer3)
        topSpace.addSubviews(recommendTitle, creationDateLabel)
        
        mainContainer.addSubview(recommendContent)
        lectureContainer1.addSubview(majorNameLabel)
        lectureContainer2.addSubview(majorNameLabel2)
        lectureContainer3.addSubview(majorNameLabel3)
        
        
        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(315)
            $0.height.equalTo(147)
        }
        
        recommendTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(creationDateLabel.snp.trailing).offset(5)
        }
        creationDateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        mainContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.width.equalTo(168)
            $0.height.equalTo(105)
        }
        
//        recommendSubListView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(30)
//            $0.bottom.equalToSuperview()
//            $0.leading.equalTo(mainContainer.snp.trailing).offset(10)
//            $0.width.equalTo(100)
//        }
        
        recommendContent.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(150)
        }
        
        lectureContainer1.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(112)
            $0.height.equalTo(28)
        }
        
        majorNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        lectureContainer2.snp.makeConstraints {
            $0.top.equalTo(lectureContainer1.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(112)
            $0.height.equalTo(28)
        }
        
        majorNameLabel2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        lectureContainer3.snp.makeConstraints {
            $0.top.equalTo(lectureContainer2.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(112)
            $0.height.equalTo(28)
        }
        
        majorNameLabel3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    
    
    //MARK: - SetData
    
    
    
    func configure(with review: RecommendDataModel) {
        recommendTitle.text = review.titleLabel
        titleLabel.text = review.titleLabel
//        majorNameLabel.text = review.majorNameLabel
        nickname.text = review.nickNameLabel
        creationDateLabel.text = "[\(review.creationDateLabel)]"
        recommendContent.text = review.contentLabel
    }
    
    func configureUpdate(with review: RootRecommendDataModel, at indexPath: IndexPath) {
        recommendTitle.text = review.title
        recommendContent.text = review.recommendation
        let creationDate = review.createAt.split(separator: "T")
        creationDateLabel.text = String(creationDate[0])
        
        let lectureIndex = indexPath.row % (review.preLectures.count)
        
        majorNameLabel.text = review.preLectures[lectureIndex].lecNames[0]
        
        // 주어진 배열 범위 내에 있는지 확인합니다.
        if lectureIndex + 1 < review.preLectures.count {
            majorNameLabel2.text = review.preLectures[lectureIndex + 1].lecNames[0]
        }
    }
}
