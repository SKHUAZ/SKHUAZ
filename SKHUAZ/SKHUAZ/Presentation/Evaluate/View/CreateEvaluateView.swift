//
//  CreateEvaluateView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/06.
//


import UIKit

import Then
import SnapKit

class CreateEvaluateView: UIView {
    
    // MARK: - Properties
    
    private let placeholderTextView = "본문을 작성해주세요"
    private let placeholderColor = UIColor(hex: "#737373")
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(hex: "#737373"),
    ]
    
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let topSpace = UIView()
    private let topLabel = UILabel()
    private let guideWrite = UILabel()
    private let semesterView = UIView()
    private let propeserView = UIView()
    private let lectureView = UIView()
    private let titleTextField = UITextField()
    private let evaluateView = UITextView()
    private let guidePoint = UILabel()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let fourthLabel = UILabel()
    private let firstTextField = UITextField()
    private let secondTextField = UITextField()
    private let thirdTextField = UITextField()
    private let fourthTextField = UISlider(frame: CGRect(x: 0, y: 0, width: 229, height: 30))
    //UITextField()
    
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

extension CreateEvaluateView {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        containerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderWidth = 1
        }
        
        topSpace.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        topLabel.do {
            $0.text = "강의평"
            $0.textColor = UIColor(hex: "#FFFFFF")
            $0.font = .systemFont(ofSize: 16)
        }
        
        guideWrite.do {
            $0.text = "강의 평가 작성"
            $0.textColor = UIColor(hex: "#737373")
            $0.font = .systemFont(ofSize: 16)
        }
        
        semesterView.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
        }
        
        propeserView.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
        }
        
        lectureView.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
        }
        
        titleTextField.do {
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = .black
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요", attributes: attributes)
            let paddingView = UIView(frame:CGRect(x:0, y:0, width:8, height:$0.frame.height))
            $0.leftViewMode = .always
            $0.leftView = paddingView
        }
        
        evaluateView.do {
            $0.text = placeholderTextView
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = placeholderColor
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.textContainerInset = UIEdgeInsets(top: 9, left: 5, bottom: 0, right: 0)
            $0.layer.cornerRadius = 6
        }
        
        guidePoint.do {
            $0.text = "강의 점수 평가"
            $0.textColor = UIColor(hex: "#737373")
            $0.font = .systemFont(ofSize: 16)
        }
        
        firstTextField.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.attributedPlaceholder = NSAttributedString(string: "1 ~ 100 사이 입력", attributes: attributes)
            $0.setLeftPaddingPoints(8)
        }
        
        secondTextField.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.attributedPlaceholder = NSAttributedString(string: "1 ~ 100 사이 입력", attributes: attributes)
            $0.setLeftPaddingPoints(8)
            
        }
        
        thirdTextField.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.attributedPlaceholder = NSAttributedString(string: "1 ~ 100 사이 입력", attributes: attributes)
            $0.setLeftPaddingPoints(8)
        }
        
        fourthTextField.do {
//            $0.placeholder = "1 ~ 100 사이 입력"
//            $0.textColor = .black
//            $0.font = .systemFont(ofSize: 8)
//            $0.backgroundColor = UIColor(hex: "#EFEFEF")
//            $0.layer.cornerRadius = 6
//            $0.attributedPlaceholder = NSAttributedString(string: "1 ~ 100 사이 입력", attributes: attributes)
//            $0.setLeftPaddingPoints(8)
            $0.minimumValue = 0
            $0.maximumValue = 100
            $0.value = 50
            $0.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        }
        
        firstLabel.do {
            $0.text = "{평가영역 1}"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        secondLabel.do {
            $0.text = "{평가영역 2}"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        thirdLabel.do {
            $0.text = "{평가영역 3}"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        fourthLabel.do {
            $0.text = "{평가영역 4}"
            $0.font = .systemFont(ofSize: 8)
            $0.textColor = UIColor(hex: "#000000")
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        containerView.addSubviews(topSpace, topLabel, guideWrite,
                                  semesterView, propeserView, lectureView,
                                  titleTextField, evaluateView, guidePoint,
                                  firstTextField, secondTextField, thirdTextField,
                                  fourthTextField, firstLabel, secondLabel,
                                  thirdLabel, fourthLabel)
        addSubviews(containerView)
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(315)
            $0.height.equalTo(640)
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(37)
        }
        
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.centerX.equalToSuperview()
        }
        
        guideWrite.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        
        semesterView.snp.makeConstraints {
            $0.top.equalTo(guideWrite.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(283)
            $0.height.equalTo(30)
        }
        
        propeserView.snp.makeConstraints {
            $0.top.equalTo(semesterView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(283)
            $0.height.equalTo(30)
        }
        
        lectureView.snp.makeConstraints {
            $0.top.equalTo(propeserView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(283)
            $0.height.equalTo(30)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(lectureView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(283)
            $0.height.equalTo(30)
        }
        
        evaluateView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(283)
            $0.height.equalTo(200)
        }
        
        guidePoint.snp.makeConstraints {
            $0.top.equalTo(evaluateView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(15)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(guidePoint.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(69)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(229)
            $0.height.equalTo(30)
        }
        
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(69)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(229)
            $0.height.equalTo(30)
        }
        
        thirdTextField.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(69)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(229)
            $0.height.equalTo(30)
        }
        
        fourthTextField.snp.makeConstraints {
            $0.top.equalTo(thirdTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(69)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(229)
            $0.height.equalTo(30)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(guidePoint.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(15)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(15)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(15)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        evaluateView.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        print("Slider value changed to \(sender.value)")
    }
    
}


extension CreateEvaluateView: UITextViewDelegate {
    
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
