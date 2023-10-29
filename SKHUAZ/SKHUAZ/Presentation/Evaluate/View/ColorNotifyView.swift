//
//  ColorNotifyView.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/29/23.
//

import UIKit

import Then
import SnapKit

class ColorNotifyView: UIView {
    
    // MARK: - UI Components
    
    private let boxTask = UIView()
    private let labelTask = UILabel()
    private let boxPractice = UIView()
    private let labelPractice = UILabel()
    private let boxPresentation = UIView()
    private let labelPresentation = UILabel()
    private let boxTeamPlay = UIView()
    private let labelTeamPlay = UILabel()
    
    
    // MARK: - Properties

    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
extension ColorNotifyView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        boxTask.do {
            $0.backgroundColor = UIColor(hex: "#0C276A")
        }
        
        boxPractice.do {
            $0.backgroundColor = UIColor(hex: "#4678C6")
        }
        
        boxPresentation.do {
            $0.backgroundColor = UIColor(hex: "#DAE1E9")
        }
        
        boxTeamPlay.do {            
            $0.backgroundColor = UIColor(hex: "#ACC3E5")
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {}
    
}
