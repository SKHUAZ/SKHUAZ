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
    
    // MARK: - UI Components
    
    private let searchBar = UISearchBar()
    
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
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = UIColor(hue: 0.55, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        
        searchBar.do {
            $0.tintColor = .black
            $0.placeholder = "강의명 검색"
            $0.backgroundImage = UIImage() // Clear background
        }
    }
}

