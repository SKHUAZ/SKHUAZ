//
//  CreateEvaluateView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/26.
//

import UIKit

import Then
import SnapKit

class CreateEvaluateView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let mainImage = UIView()
    private let mainContainer = UIView()
    private let topSpace = UIView()
    private let topLabel = UILabel()
    private let warringLabel = UILabel()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateEvaluateView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        mainContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        topLabel.do {
            $0.text = "강의평"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        
    }
    
    // MARK: - @objc Methods
    
}
