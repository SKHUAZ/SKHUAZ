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
    private let recommendSubListView = UITableView()
        
    private let recommendContent = UILabel()
    private let recommendTitle = UILabel()
    
    private let nickname = UILabel()
    private let courseYear = UILabel()
    private let titleLabel = UILabel()
    private let majorNameLabel = UILabel()
    private let creationDateLabel = UILabel()
    var reviewList: [RecommendDataModel] = []
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
//        setupData()
//        setDelegate()
//        setUITableView()
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
        recommendListContainer.addSubviews(topSpace, mainContainer, recommendSubListView)
        
        topSpace.addSubviews(recommendTitle)
        
        mainContainer.addSubview(recommendContent)
        recommendSubListView.addSubview(majorNameLabel)
        
        
        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
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
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.width.equalTo(168)
            $0.height.equalTo(105)
        }
        
        recommendSubListView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(mainContainer.snp.trailing).offset(10)
            $0.width.equalTo(150)
        }
        
        recommendContent.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
        }
        
        majorNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(8)
        }
    }
    
    private func setupData() {
        reviewList = [recommendReview1, recommendReview2, recommendReview3]
        recommendSubListView.reloadData()
    }
    
    private func setDelegate() {
        recommendSubListView.delegate = self
    }
    
    private func setUITableView() {
        recommendSubListView.dataSource = self
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
        
}

extension RecommendTableViewCell: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecommendSubTableViewCell
        let review = reviewList[indexPath.row]
        
        cell.configure(with: review)
        
        return cell
    }
}
