//
//  CreateRecommendView.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/07.
//

import UIKit
import Then
import SnapKit

class CreateRecommendView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let pageName = UILabel()
    private let titleTextField = UITextView()
    private let contentTextField = UITextView()
    private let bringButton = UIButton()
    private let bringButtonLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateRecommendView {
    
    // MARK: - UI Components Property
    
    
    private func setUI(){
        
        pageName.do {
            $0.text = "루트 추천 작성"
            $0.textColor = UIColor(hex: "#737373")
            $0.font = .systemFont(ofSize: 25)
        }
        
        titleTextField.do {
            $0.text = "제목을 입력해주세요"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = UIColor(hex: "#737373")
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.textContainerInset = UIEdgeInsets(top: 9, left: 5, bottom: 0, right: 0)
            $0.layer.cornerRadius = 6
        }
        
        contentTextField.do {
            $0.text = "본문을 작성해주세요"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = UIColor(hex: "#737373")
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.textContainerInset = UIEdgeInsets(top: 9, left: 5, bottom: 0, right: 0)
            $0.layer.cornerRadius = 6
        }
        
        bringButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("선수과목제도 불러오기", for: .normal)
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(pageName,
                    titleTextField, contentTextField, bringButton)
        
        pageName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(-12)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(pageName.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(40)
        }
        
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(220)
        }
        
        bringButton.snp.makeConstraints {
            $0.top.equalTo(contentTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        contentTextField.delegate = self
        titleTextField.delegate = self
    }
    
    private func setAddTarget() {}
    
}

extension CreateRecommendView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(hex: "#737373") {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "본문을 작성해주세요" {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "본문을 작성해주세요"
            textView.textColor = UIColor(hex: "#737373")
        }
    }
}
