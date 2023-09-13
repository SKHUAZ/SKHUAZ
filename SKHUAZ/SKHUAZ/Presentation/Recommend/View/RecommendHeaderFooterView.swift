//
//  RecommendHeaderFooterView.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/09.
//

import UIKit
import Then
import SnapKit

class RecommendCustomPagenationView: UITableViewHeaderFooterView {
    // MARK: - UI Components

    private let leftArrowButton = UIButton()
    private let rightArrowButton = UIButton()
    private let firstButton = UIButton()
    private let secoundButton = UIButton()
    private let thirdButton = UIButton()
    private let fourthButton = UIButton()
    private let fifthButton = UIButton()


    // MARK: - Initializer

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendCustomPagenationView {

    // MARK: - Layout Helper

    private func setLayout() {
        addSubviews(leftArrowButton)
        
//        leftArrowButton.snp.makeConstraints {
//            
//        }
    }

    // MARK: - UI Components Property

    private func setUI() {
        contentView.backgroundColor = UIColor(hue: 0.55, saturation: 0.4, brightness: 0.9, alpha: 1.0)

        leftArrowButton.do {
            $0.setImage(Image.list, for: .normal)
        }
    }
}
