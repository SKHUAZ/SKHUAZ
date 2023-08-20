//
//  EvaluateTableViewCell.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import SnapKit
import Then

class EvaluateTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let topStackView = UIStackView()
    private let lectureNameLabel = UILabel()
    private let professorNameLabel = UILabel()
    private let courseYearLabel = UILabel()
    private let totalScoreLabel = UILabel()
    private let testUIView = UIView()
    private let bottomStackView = UIStackView()
    private let authorNameLabel = UILabel()
    private let dateCreatedLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EvaluateTableViewCell {
    
    // MARK: - Configure
    
    func configure(with review: EvaluateDataModel) {
        lectureNameLabel.text = review.lectureNameLabel
        professorNameLabel.text = review.professorNameLabel
        courseYearLabel.text = review.courseYearLabel
        totalScoreLabel.text = "\(review.totalScoreLabel)"
        authorNameLabel.text = review.authorNameLabel
        dateCreatedLabel.text = review.dateCreatedLabel
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(topStackView, testUIView, totalScoreLabel
                                ,bottomStackView)
        topStackView.addArrangedSubviews(lectureNameLabel, professorNameLabel, courseYearLabel)
        bottomStackView.addArrangedSubviews(authorNameLabel, dateCreatedLabel)

        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        totalScoreLabel.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }

      
        testUIView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(340)
            $0.height.equalTo(80)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(testUIView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        topStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
            $0.distribution = .fillProportionally
        }
        
        lectureNameLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = .red
        }
        
        professorNameLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = .blue
        }
        
        courseYearLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = .green
        }
        
        totalScoreLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.backgroundColor = .yellow
        }
        
        testUIView.do {
            $0.backgroundColor = .lightGray
            $0.snp.makeConstraints { make in
                make.width.equalTo(340)
                make.height.equalTo(80)
            }
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        authorNameLabel.do {
            $0.font = .boldSystemFont(ofSize: 10)
        }
        
        dateCreatedLabel.do {
            $0.font = .boldSystemFont(ofSize: 10)
        }
    }
}
