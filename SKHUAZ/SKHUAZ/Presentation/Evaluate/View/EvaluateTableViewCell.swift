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
    
    // MARK: - Properties

    
    // MARK: - UI Components
    
    private let topStackView = UIStackView()
    private let lectureNameLabel = UILabel()
    private let professorNameLabel = UILabel()
    private let courseYearLabel = UILabel()
    private let totalScoreLabel = UILabel()
    
    private let assessmentChartView = UIView()
    private let courseOverallReviewView = UIView()
    
    private let bottomStackView = UIStackView()
    private let authorNameLabel = UILabel()
    private let dateCreatedLabel = UILabel()

    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EvaluateTableViewCell {

    // MARK: - UI Components Property

    private func setUI(){
        
        topStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
        }
        
        lectureNameLabel.do {
            $0.text = "데이터베이스"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        professorNameLabel.do {
            $0.text = "홍은지"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        courseYearLabel.do {
            $0.text = "2023-1"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        totalScoreLabel.do {
            $0.text = "☆★★★★"
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        assessmentChartView.do {
            $0.backgroundColor = .gray
        }
        
        courseOverallReviewView.do {
            $0.backgroundColor = .gray
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
        }
        
        authorNameLabel.do {
            $0.text = "천성우"
            $0.font = .boldSystemFont(ofSize: 10)
            $0.textColor = .black
        }
        
        dateCreatedLabel.do {
            $0.text = "2023-08-17"
            $0.font = .boldSystemFont(ofSize: 10)
            $0.textColor = .black
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        topStackView.addArrangedSubviews(lectureNameLabel, professorNameLabel, courseYearLabel, totalScoreLabel)
        bottomStackView.addArrangedSubviews(authorNameLabel, dateCreatedLabel)
        contentView.addSubviews(topStackView, assessmentChartView, courseOverallReviewView, bottomStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview().inset(27)
            $0.height.equalTo(40)
        }
        
        lectureNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().offset(7)
        }
        
        professorNameLabel.snp.makeConstraints {
            $0.top.equalTo(lectureNameLabel.snp.top)
            $0.leading.equalTo(lectureNameLabel.snp.trailing).offset(15)
        }
        
        courseYearLabel.snp.makeConstraints {
            $0.top.equalTo(professorNameLabel.snp.top)
            $0.leading.equalTo(professorNameLabel.snp.trailing).offset(15)
        }
        
        totalScoreLabel.snp.makeConstraints {
            $0.top.equalTo(courseYearLabel.snp.top)
            $0.trailing.equalToSuperview().inset(9)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}
