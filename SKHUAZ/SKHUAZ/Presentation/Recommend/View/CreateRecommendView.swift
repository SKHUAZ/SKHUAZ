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
    
    enum RecommendType {
        case createRecommend
        case datailsRecommend
    }
    
    // MARK: - UI Components
    
//    private let containerView = UIView()
    private let recommendType: RecommendType
    private let pageName = UILabel()
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    
    private let placeholderTextView = "본문을 작성해주세요"
    private let placeholderColor = UIColor(hex: "#737373")
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(hex: "#737373"),
    ]
    
    // MARK: - Getter
    
    var titleTextFieldText: String? {
        return titleTextField.text
    }
    
    var contentTextFieldText: String? {
        return contentTextView.text
    }
    
    // MARK: - Initializer
    
    init(frame: CGRect, recommendType: RecommendType) {
        self.recommendType = recommendType
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
        
        switch recommendType {
        case .createRecommend:
            pageName.do {
                $0.text = "루트 추천 작성"
                $0.textColor = UIColor(hex: "#737373")
                $0.font = .systemFont(ofSize: 25)
            }
            
            titleTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = UIColor(hex: "#737373")
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
                $0.returnKeyType = .done
            }
            
            contentTextView.do {
                $0.text = placeholderTextView
                $0.font = .systemFont(ofSize: 11)
                $0.textColor = placeholderColor
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.textContainerInset = UIEdgeInsets(top: 9, left: 8, bottom: 0, right: 0)
                $0.layer.cornerRadius = 6
            }
            
        case .datailsRecommend:
            titleTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = UIColor(hex: "#737373")
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
                $0.returnKeyType = .done
                $0.isEnabled = false
            }
            
            contentTextView.do {
                $0.text = placeholderTextView
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = placeholderColor
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.textContainerInset = UIEdgeInsets(top: 9, left: 8, bottom: 0, right: 0)
                $0.layer.cornerRadius = 6
                $0.isEditable = false
            }
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(pageName,
                    titleTextField, contentTextView)
        
        pageName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(27)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(pageName.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(40)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(220)
        }
        
        
    }
    
    // MARK: - Methods
    
    private func setupData() {
//        importReviewList = [ImportRootReview1, ImportRootReview2, ImportRootReview3]
//        testTableListView.reloadData()
    }
    
    private func setDelegate() {
        contentTextView.delegate = self
    }
    
    func setDetailRecommendView(title: String, content: String) {
        titleTextField.text = title
        contentTextView.text = content
    }
}

extension CreateRecommendView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == placeholderColor {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == placeholderTextView {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderTextView
            textView.textColor = placeholderColor
        }
    }

}

