//
//  AlertViewOfRecommendController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/17.
//

import UIKit

import SnapKit
import Then

enum RecommendAlertType {
    case saveCompleteCreateRootView
    case notEnteredCreateRootView
}

final class AlertViewOfRecommendController: UIViewController {
    
    // MARK: - UI Components
    
    private let alertView = UIView()
    private let mainLabel = UILabel()
    private let checkButton = UIButton()
    
    // MARK: - Properties
    
    private let alertType: RecommendAlertType
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
    
    // MARK: - Initializer
    
    init(alertType: RecommendAlertType) {
        self.alertType = alertType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertViewOfRecommendController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        switch alertType {
        
        case .saveCompleteCreateRootView:
            mainLabel.do {
                $0.text = "저장이 완료되었습니다."
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
            }
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#ED7A7A").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#ED7A7A")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
            
        case .notEnteredCreateRootView:
            mainLabel.do {
                $0.text = "강의평 작성하기를\n모두 입력해주세요"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
                $0.numberOfLines = 2
            }
            
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#000000").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#000000")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
        }
        
        alertView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 8
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(alertView)
        
        alertView.addSubviews(
            mainLabel,
            checkButton
        )
        
        alertView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(144)
            $0.center.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(77)
            $0.width.equalTo(147)
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(107)
            $0.width.equalTo(87)
            $0.height.equalTo(34)
        }
        
    }
    
    // MARK: - Methodes
    
    private func addTarget() {
        checkButton.addTarget(self, action: #selector(touchdeleteButton), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func touchdeleteButton() {
        dismiss(animated: false, completion: nil)
        print("바보")
    }
}


