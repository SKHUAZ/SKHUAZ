//
//  EvaluateTableViewCell.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import Then
import SnapKit

class EvaluateTableViewCell: UITableViewCell {
    
    // MARK: - Property
        
    // MARK: - UI Components
    private let cellContainer = UIView()
    private let mainContainer = UIView()
    private let subContainer = UIView()
    private let evaluateReview = UILabel()
    private let topSpace = UIView()
    private let evaluateTitle = UILabel()
    private let lectureNameLabel = UILabel()
    private let professorNameLabel = UILabel()
    private let evaluateGraph = CircleGraphView(frame: CGRect(x: 0, y: 0, width: 104, height: 104))
    
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

extension EvaluateTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        cellContainer.do {
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
            $0.layer.backgroundColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        subContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        evaluateReview.do {
            $0.font = .systemFont(ofSize: 12)
            $0.numberOfLines = 6
        }
        
        evaluateGraph.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
        }
        
        evaluateTitle.do {
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = UIColor(hex: "#FFFFFF")
        }
        
        lectureNameLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .black
        }
        
        professorNameLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .black
        }
        
        evaluateGraph.do {
            $0.lineWidth = 30
            $0.backgroundColor = .white
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(cellContainer)
        cellContainer.addSubviews(topSpace, mainContainer, subContainer,
                                  evaluateGraph)
        subContainer.addSubviews(evaluateReview)
        topSpace.addSubviews(evaluateTitle)
        mainContainer.addSubviews(lectureNameLabel, professorNameLabel)
        
        cellContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(36)
            $0.width.equalTo(315)
            $0.height.equalTo(194)
        }
        
        evaluateReview.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(7)
            $0.width.equalTo(135)
        }
        
        lectureNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(8)
        }
        
        professorNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        evaluateTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(26)
        }
        
        mainContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(35)
        }
        
        subContainer.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(160)
            $0.height.equalTo(105)
        }
        
        evaluateGraph.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(30)
            $0.trailing.equalToSuperview().inset(19)
            $0.width.height.equalTo(104)
        }

    }
    
    // MARK: - Configure
    
    func configure(with review: EvaluateDataModel) {
        evaluateTitle.text = "[\(review.semester)]  \(review.title)"
        lectureNameLabel.text = review.lecture
        professorNameLabel.text = review.professor
        evaluateReview.text = review.evaluate
        evaluateGraph.numbers = [review.firstPoint, review.secondPoint, review.thirdPoint, review.fourthPoint]
    }

}
