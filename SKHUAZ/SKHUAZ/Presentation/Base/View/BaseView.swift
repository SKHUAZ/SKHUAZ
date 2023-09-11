//
//  BaseView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import UIKit
import Then
import SnapKit

class BaseView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    private func setUI(){
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {}
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}
