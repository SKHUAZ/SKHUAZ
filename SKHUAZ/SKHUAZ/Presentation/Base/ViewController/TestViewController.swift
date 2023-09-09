//
//  TestViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/08/26.
//

import Foundation
import UIKit
import SnapKit
import Then

final class TestViewController: UIViewController {

    // MARK: - UI Components
    
    private let testStackView = UIStackView()

    private let firstLabel = UILabel()
    private let secondLabel = UILabel()

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
            $0.text = "드디어 떴다!"
            $0.textColor = .white
            $0.backgroundColor = .red
        }
        
        secondLabel.do {
            $0.text = "우성천천"
            $0.textColor = .white
            $0.backgroundColor = .blue
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        testStackView.addArrangedSubviews(firstLabel, secondLabel)
        view.addSubview(testStackView)
        
        testStackView.snp.makeConstraints {
//            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
}
