//
//  TestViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/20.
//

import UIKit

import SnapKit
import Then

final class TestViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let testStackView = UIStackView()
    
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let fourthLabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension TestViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .white
        
        testStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
            $0.distribution = .fillProportionally
        }
        
        firstLabel.do {
            $0.text = "자바 자바 자바"
            $0.textColor = .white
            $0.backgroundColor = .red
        }
        
        secondLabel.do {
            $0.text = "허지영"
            $0.textColor = .white
            $0.backgroundColor = .blue
        }
        
        thirdLabel.do {
            $0.text = "2023-1"
            $0.textColor = .white
            $0.backgroundColor = .yellow
        }
        
        fourthLabel.do {
            $0.text = "4"
            $0.textColor = .white
            $0.backgroundColor = .yellow
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        testStackView.addArrangedSubviews(firstLabel, secondLabel, thirdLabel,
                                         fourthLabel)
        view.addSubview(testStackView)
        
        testStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        fourthLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
        }
        
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
