//
//  EvaluateView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/06.
//


import UIKit

import Then
import SnapKit

enum EvaluateViewType {
    case createEvalute
    case detailEvalute
}


class EvaluateView: UIView {
    
    // MARK: - Properties
    
    private let evaluateType: EvaluateViewType
    private let placeholderTextView = "본문을 작성해주세요"
    private let placeholderColor = UIColor(hex: "#737373")
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(hex: "#737373"),
    ]
    
    private var semesterButtonClosure: (() -> Void)?
    private var professorButtomClosure: (() -> Void)?
    private var lectureButtonClosure: (() -> Void)?
    private var titleTextFieldClosure: (() -> Void)?
    private var evaluateClosure: (() -> Void)?
    private var firstSliderClosure: (() -> Void)?
    private var secondSliderClosure: (() -> Void)?
    private var thirdSliderClosure: (() -> Void)?
    private var fourthSliderClosure: (() -> Void)?
    
    // MARK: - Delegate Property
    
    private var semesterDropdownMenu: CustomDropdownMenu?
    private var professorDropdownMenu: CustomDropdownMenu?
    private var lectureDropdownMenu: CustomDropdownMenu?
    
    // MARK: - UI Components
    
    private let guideWrite = UILabel()
    private var semesterButton = UIButton(type: .system)
    private var professorButton = UIButton(type: .system)
    private var lectureButton = UIButton(type: .system)
    private let titleTextField = UITextField()
    private let evaluateView = UITextView()
    private let guidePoint = UILabel()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let thirdLabel = UILabel()
    private let fourthLabel = UILabel()
    private let firstSlider = CustomSlider(frame: CGRect(x: 0, y: 0, width: 229, height: 30))
    private let secondSlider = CustomSlider(frame: CGRect(x: 0, y: 0, width: 229, height: 30))
    private let thirdSlider = CustomSlider(frame: CGRect(x: 0, y: 0, width: 229, height: 30))
    private let fourthSlider = CustomSlider(frame: CGRect(x: 0, y: 0, width: 229, height: 30))
    
    // MARK: - Getter
    
    var semesterButtonTitle: String? {
        return semesterButton.titleLabel?.text
    }
    
    var propeserButtonTitle: String? {
        return professorButton.titleLabel?.text
    }
    
    var lectureButtonTitle: String? {
        return lectureButton.titleLabel?.text
    }
    
    var titleTextFieldText: String? {
        return titleTextField.text
    }
    
    var evaluateViewText: String? {
        return evaluateView.text
    }
    
    var firstSliderValue: Int {
        return Int(firstSlider.value)
    }
    
    var secondSliderValue: Int {
        return Int(secondSlider.value)
    }
    
    var thirdSliderValue: Int {
        return Int(thirdSlider.value)
    }
    
    var fourthSliderValue: Int {
        return Int(fourthSlider.value)
    }
    
    // MARK: - Initializer
    
    init(frame: CGRect, evaluateType: EvaluateViewType) {
        self.evaluateType = evaluateType
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setDelegate()
        setupDropdownMenus()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EvaluateView: DropdownMenuDelegate {
    
    // MARK: - UI Components Property
    
    private func setUI(){
        
        switch evaluateType {
        case .createEvalute:
            
            
            guideWrite.do {
                $0.text = "강의 평가 작성"
                $0.textColor = UIColor(hex: "#737373")
                $0.font = .systemFont(ofSize: 16)
            }
            
            semesterButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleWithLeftPadding("학기를 선택해주세요", for: .normal, leftPadding: 13)
                $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            professorButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleWithLeftPadding("교수님을 선택해주세요", for: .normal, leftPadding: 13)
                $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            lectureButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleWithLeftPadding("강의를 선택해주세요", for: .normal, leftPadding: 13)
                $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            titleTextField.do {
                $0.font = .systemFont(ofSize: 11)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
                $0.returnKeyType = .done
            }
            
            evaluateView.do {
                $0.text = placeholderTextView
                $0.font = .systemFont(ofSize: 11)
                $0.textColor = placeholderColor
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.textContainerInset = UIEdgeInsets(top: 9, left: 8, bottom: 0, right: 0)
                $0.layer.cornerRadius = 6
            }
            
            guidePoint.do {
                $0.text = "강의 점수 평가"
                $0.textColor = UIColor(hex: "#737373")
                $0.font = .systemFont(ofSize: 16)
            }
            
        case .detailEvalute:
            
            guideWrite.do {
                $0.text = "강의평 상세보기"
                $0.textColor = UIColor(hex: "#737373")
                $0.font = .systemFont(ofSize: 16)
            }
            
            semesterButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            professorButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            lectureButton.do {
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.contentHorizontalAlignment = .left
                $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            }
            
            
            titleTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.isEnabled = false
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
                $0.returnKeyType = .done
            }
            
            evaluateView.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = UIColor(hex: "#000000")
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.textContainerInset = UIEdgeInsets(top: 9, left: 8, bottom: 0, right: 0)
                $0.layer.cornerRadius = 6
                $0.isEditable = false
            }
            
            guidePoint.do {
                $0.text = "강의 점수 평가"
                $0.textColor = UIColor(hex: "#737373")
                $0.font = .systemFont(ofSize: 16)
            }
            
            firstSlider.do {
                $0.isUserInteractionEnabled = false
            }
            
            secondSlider.do {
                $0.isUserInteractionEnabled = false
            }
            
            thirdSlider.do {
                $0.isUserInteractionEnabled = false
            }
            
            fourthSlider.do {
                $0.isUserInteractionEnabled = false
            }
        }
        
        firstLabel.do {
            $0.text = "과제"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        secondLabel.do {
            $0.text = "실습"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        thirdLabel.do {
            $0.text = "발표"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        fourthLabel.do {
            $0.text = "팀플"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = UIColor(hex: "#000000")
        }
    }
    
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(guideWrite,
                    semesterButton, professorButton, lectureButton,
                    titleTextField, evaluateView, guidePoint,
                    firstSlider, secondSlider, thirdSlider,
                    fourthSlider, firstLabel, secondLabel,
                    thirdLabel, fourthLabel)
        guideWrite.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(19)
        }
        
        semesterButton.snp.makeConstraints {
            $0.top.equalTo(guideWrite.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(36)
        }
        
        professorButton.snp.makeConstraints {
            $0.top.equalTo(semesterButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(36)
        }
        
        lectureButton.snp.makeConstraints {
            $0.top.equalTo(professorButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(36)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(lectureButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(36)
        }
        
        evaluateView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(19)
            $0.height.equalTo(243)
        }
        
        guidePoint.snp.makeConstraints {
            $0.top.equalTo(evaluateView.snp.bottom).offset(19)
            $0.leading.equalToSuperview().offset(19)
        }
        
        firstSlider.snp.makeConstraints {
            $0.centerY.equalTo(firstLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(268)
            $0.height.equalTo(16)
        }
        
        secondSlider.snp.makeConstraints {
            $0.centerY.equalTo(secondLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(268)
            $0.height.equalTo(16)
        }
        
        thirdSlider.snp.makeConstraints {
            $0.centerY.equalTo(thirdLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(268)
            $0.height.equalTo(16)
        }
        
        fourthSlider.snp.makeConstraints {
            $0.centerY.equalTo(fourthLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(268)
            $0.height.equalTo(16)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(guidePoint.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(45)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(45)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(45)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(45)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        evaluateView.delegate = self
        semesterButton.addTarget(self, action: #selector(testprint), for: .touchUpInside)
    }
    
    private func setupDropdownMenus() {
        let semesterOptions = ["2023-2", "2023-1", "2022-2", "2022-1"]
        semesterDropdownMenu = CustomDropdownMenu(options: semesterOptions, parentButton: semesterButton)
        semesterDropdownMenu?.delegate = self
        
        let propeserOptions = ["Professor A", "Professor B", "Professor C"]
        professorDropdownMenu = CustomDropdownMenu(options: propeserOptions, parentButton: professorButton)
        professorDropdownMenu?.delegate = self
        
        let lectureOptions = ["Lecture A", "Lecture B", "Lecture C"]
        lectureDropdownMenu = CustomDropdownMenu(options: lectureOptions, parentButton: lectureButton)
        lectureDropdownMenu?.delegate = self
    }
    
    private func addTarget() {
        
        switch evaluateType {
        case .createEvalute:
            semesterButton.addTarget(self, action: #selector(semesterButtonTapped), for: .touchUpInside)
            professorButton.addTarget(self, action: #selector(propeserButtonTapped), for: .touchUpInside)
            lectureButton.addTarget(self, action: #selector(lectureButtonTapped), for: .touchUpInside)
            firstSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            secondSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            thirdSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            fourthSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        case .detailEvalute:
            return print("상세보기 화면입니다")
        }
    }
    
    @objc private func semesterButtonTapped() {
        if let menu = semesterDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.top.equalTo(semesterButton.snp.bottom).offset(8)
                    make.leading.trailing.equalTo(semesterButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        professorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        lectureDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        
    }
    
    @objc private func propeserButtonTapped() {
        if let menu = professorDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.top.equalTo(professorButton.snp.bottom).offset(8)
                    make.leading.trailing.equalTo(professorButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        semesterDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        lectureDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        
    }
    
    @objc private func lectureButtonTapped() {
        if let menu = lectureDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.top.equalTo(lectureButton.snp.bottom).offset(8)
                    make.leading.trailing.equalTo(professorButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        semesterDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        professorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
    }
    
    func dropdownMenuDidSelectOption(_ option: String, for button: UIButton) {
        print("Selected Option for button:", option)
    }
    
    func setDetailEvaluateView(semester: String, professor: String, lecture: String,
                               title: String, evaluate: String, firstPoint: Int,
                               secondPoint: Int, thirdPoint: Int, fourtPoint: Int) {
        semesterButtonClosure?()
        professorButtomClosure?()
        lectureButtonClosure?()
        titleTextFieldClosure?()
        evaluateClosure?()
        firstSliderClosure?()
        secondSliderClosure?()
        secondSliderClosure?()
        thirdSliderClosure?()
        fourthSliderClosure?()
        semesterButton.setTitleWithLeftPadding(semester, for: .normal, leftPadding: 13)
        professorButton.setTitleWithLeftPadding(professor, for: .normal, leftPadding: 13)
        lectureButton.setTitleWithLeftPadding(lecture, for: .normal, leftPadding: 13)
        titleTextField.text = title
        evaluateView.text = evaluate
        firstSlider.value = Float(firstPoint)
        secondSlider.value = Float(secondPoint)
        thirdSlider.value = Float(thirdPoint)
        fourthSlider.value = Float(fourtPoint)
    }
    
    // MARK: - @objc Methods
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        print("Slider value changed to \(sender.value)")
    }
    
    @objc func testprint() {
        print("눌리네요~")
    }
    
}

extension EvaluateView: UITextViewDelegate {
    
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
