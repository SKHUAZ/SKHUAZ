//
//  CustomSlider.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/11.
//

import UIKit

import Then
import SnapKit

class CustomSlider: UISlider {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        minimumValue = 0
        maximumValue = 100
        value = 50
        thumbTintColor = UIColor(hex: "#9AC1D1")
        minimumTrackTintColor = UIColor(hex: "#000000")
        maximumTrackTintColor = UIColor(hex: "000000")
        let trackImage = Image.line
        setMinimumTrackImage(trackImage, for: .normal)
        setMaximumTrackImage(trackImage, for: .normal)
    }
}
