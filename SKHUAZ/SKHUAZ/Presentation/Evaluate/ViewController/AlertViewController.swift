//
//  Cus.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/07.
//

import UIKit

import SnapKit
import Then

enum CustomAlertType {
    case mainEvaluate
    case createEvaluate
    case unSelectSemester
    case unSelectLecture
}

final class AlertViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let alertView = UIView()
    private let mainLabel = UILabel()
    private let checkButton = UIButton()
    
    // MARK: - Properties
    
    private let alertType: CustomAlertType
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
    
    // MARK: - Initializer
    
    init(alertType: CustomAlertType) {
        self.alertType = alertType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        switch alertType {
        
        case .mainEvaluate:
            mainLabel.do {
                $0.text = "저장이 완료되었습니다."
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
            }
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
            
        case .mainEvaluate:
            mainLabel.do {
                $0.text = "저장이 완료되었습니다."
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
            }
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
            
        case .createEvaluate:
            mainLabel.do {
                $0.text = "강의평 작성하기를\n모두 입력해주세요"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
                $0.numberOfLines = 2
            }
            
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
        
        case .unSelectSemester:
            mainLabel.do {
                $0.text = "학기를 먼저\n선택해 주세요"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
                $0.numberOfLines = 2
            }
            
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.setTitle("확인", for: .normal)
                $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
            }
            
        case .unSelectLecture:
            mainLabel.do {
                $0.text = "강의를 먼저\n선택해 주세요"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
                $0.numberOfLines = 2
            }
            
            checkButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
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

