//
//  EssentialTableViewCell.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/23/23.
//

import UIKit

import SnapKit
import Then

class EssentialTableViewCell: UITableViewCell {
            
    // MARK: - UI Components
    
    private let EssentialContainer = UIView()
    private let lectureLabel = UILabel()
    private let semesterLabel = UILabel()
    
    // MARK: - Property

    
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

extension EssentialTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        EssentialContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
        }
        
        lectureLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 11)
        }
        
        semesterLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .systemFont(ofSize: 11)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(EssentialContainer)
        EssentialContainer.addSubviews(lectureLabel, semesterLabel)
        
        EssentialContainer.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(330)
            $0.height.equalTo(38)
        }
        
        lectureLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        semesterLabel.snp.makeConstraints {
            $0.top.equalTo(lectureLabel.snp.top)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Configure
    
    func configure(with item: adminPreLecture) {
        lectureLabel.text = item.subjectName
        semesterLabel.text = item.subjectSemester
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            EssentialContainer.backgroundColor = UIColor(hex: "#9AC1D1")
        } else {
            EssentialContainer.backgroundColor = UIColor(hex: "#EFEFEF")
        }
    }
}
