//
//  RecommendSubTableViewCell.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/11.
//

import UIKit

import Then
import SnapKit

class RecommendSubTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    private let recommendSubBox = UIView()
    private let lectureName = UILabel()
    
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


extension RecommendSubTableViewCell {
    
    // MARK: - UI Components Property
        
    private func setUI() {
        
        recommendSubBox.do {
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        lectureName.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.backgroundColor = .white
        }

    }
    
    // MARK: - Layout Helper
    
    func setLayout() {

        
        contentView.addSubviews(recommendSubBox)
        recommendSubBox.addSubviews(lectureName)
        
        recommendSubBox.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(20)
        }
        
        
    }
    
    //MARK: - configure
    
    func configure(with review: RecommendDataModel) {
        lectureName.text = review.lectureNameLabel
    }
        
}
