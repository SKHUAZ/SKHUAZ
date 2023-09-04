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
    
    private var evaluatePoint: [Int] = [0, 0, 0 ,0]
    
    // MARK: - UI Components
    private let cellContainer = UIView()
    private let mainContainer = UIView()
    private let subContainer = PaddingLabel()
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
        
        subContainer.do {
            $0.font = .systemFont(ofSize: 8)
            $0.numberOfLines = 6
            $0.layer.cornerRadius = 6
            $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1).cgColor
            $0.topInset = 6
            $0.rightInset = 9
            $0.bottomInset = 6
            $0.leftInset = 7
        }
        
        evaluateGraph.do {
            $0.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
        }
        
        evaluateTitle.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .white
            $0.backgroundColor = .black
        }
        
        lectureNameLabel.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
        }
        
        professorNameLabel.do {
            $0.font = .systemFont(ofSize: 8)
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
        topSpace.addSubviews(evaluateTitle)
        mainContainer.addSubviews(lectureNameLabel, professorNameLabel)
        
        cellContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(36)
            $0.width.equalTo(315)
            $0.height.equalTo(147)
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
            $0.height.equalTo(20)
        }
        
        mainContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.width.equalTo(150)
            $0.height.equalTo(30)
        }
        
        subContainer.snp.makeConstraints {
            $0.top.equalTo(mainContainer.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(150)
            $0.height.equalTo(72)
        }
        
        evaluateGraph.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(19)
            $0.width.height.equalTo(104)
        }

    }
    
    // MARK: - Configure
    
    func configure(with review: EvaluateDataModel) {
        evaluateTitle.text = "[\(review.courseYearLabel)]  \(review.title)"
        lectureNameLabel.text = review.lectureNameLabel
        professorNameLabel.text = review.professorNameLabel
        subContainer.text = review.evaluate
        evaluateGraph.numbers = [review.evaluatePoint1, review.evaluatePoint2, review.evaluatePoint3, review.evaluatePoint4]
    }
}
