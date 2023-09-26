//
//  SaveEssentialSubContainerView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import UIKit

import Then
import SnapKit

final class SaveEssentialSubContainerView: UIView {
    private let lectureLabel = UILabel()
    private let semesterLabel = UILabel()

    init(lectureName: String, professorName: String) {
        super.init(frame: .zero)
        setupUI(lectureName: lectureName, professorName: professorName)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(lectureName: String, professorName: String) {
        backgroundColor = UIColor(hex:"#EFEFEF")

        lectureLabel.do {
            $0.text = lectureName
            $0.textColor = UIColor(hex:"#000000")
            $0.font = .systemFont(ofSize:11)
        }

        semesterLabel.do {
            $0.text = professorName
            $0.textColor = UIColor(hex:"#000000")
            $0.font = .systemFont(ofSize:11)
            $0.textAlignment = .right // 오른쪽 정렬
        }

        addSubviews(lectureLabel, semesterLabel)
    }

    private func setupLayout() {
        lectureLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.centerY.equalToSuperview()
        }

        semesterLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
        }
    }
}

