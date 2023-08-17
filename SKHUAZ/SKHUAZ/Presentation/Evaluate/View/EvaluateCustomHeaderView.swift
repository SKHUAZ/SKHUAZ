//
//  EvaluateCustomHeaderView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import Then
import SnapKit

class EvaluateCustomHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    
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

extension EvaluateCustomHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {}
    
    // MARK: - Methods
    
    private func setAddTarget() {}
    
    // MARK: - @objc Methods
    
}
