//
//  DetailEvaluateView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import Then
import SnapKit

class DetailEvaluateView: UIView {
    
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


extension DetailEvaluateView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {}
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}

