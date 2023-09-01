//
//  EvaluateCustomHeaderView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import Then
import SnapKit

    // MARK: - protocol 채택

protocol EvaluateCustomHeaderViewDelegate: AnyObject {
    func optionButtonTapped(title: String)
}

class EvaluateCustomHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let optionHorizontalScrollView = UIScrollView()
    private let optionBar = UIStackView()
    private let saveButton = UIButton()
    private let optionSW = UIButton()
    private let optionCE = UIButton()
    private let optionICE = UIButton()
    private let optionAI = UIButton()
    
    // MARK: - Property
    
    weak var delegate: EvaluateCustomHeaderViewDelegate?

    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EvaluateCustomHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        contentView.backgroundColor = UIColor(hue: 0.55, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        
        optionHorizontalScrollView.do {
            $0.showsHorizontalScrollIndicator = false
        }
        
        optionBar.do {
            $0.backgroundColor = .gray
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        saveButton.do {
            $0.setImage(UIImage(systemName: "plus.app"), for: .normal)
            $0.backgroundColor = .green
        }
        
        optionSW.do {
            $0.setTitle("소프트웨어공학", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 7
        }
        
        optionCE.do {
            $0.setTitle("컴퓨터공학", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 7
        }
        
        optionICE.do {
            $0.setTitle("정보통신공학", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 7
        }
        
        optionAI.do {
            $0.setTitle("인공지능", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 10)
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(optionHorizontalScrollView, saveButton)
        optionHorizontalScrollView.addSubview(optionBar)
        optionBar.addArrangedSubviews(optionSW, optionCE, optionICE,
                                      optionAI)
        
        optionHorizontalScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(5)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(optionHorizontalScrollView.snp.top)
            $0.trailing.equalToSuperview().inset(7)
            $0.height.width.equalTo(29)
        }
        
        optionBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        optionSW.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(29)
        }
        
        optionCE.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(29)
        }
        
        optionICE.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(29)
        }
        
        optionAI.snp.makeConstraints {
            $0.width.equalTo(105)
            $0.height.equalTo(29)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        optionSW.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionCE.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionICE.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionAI.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods

    @objc private func optionButtonTapped(_ sender: UIButton) {
        if let selectedOption = sender.currentTitle {
            print("Selected Option: \(selectedOption)")
            delegate?.optionButtonTapped(title: selectedOption)
        }
    }
}
