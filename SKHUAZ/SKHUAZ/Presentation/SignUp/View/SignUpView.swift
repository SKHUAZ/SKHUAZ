//
//  SignUpView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

import SnapKit
import Then

protocol SignUpViewDelegate: AnyObject {
    func nicknameCheckButtonTapped()
    func emailCheckButtonTapped()
    func signUpButtonTapped()
}

final class SignUpView: UIView, SendStringData, DropdownMenuDelegate {

    func sendData(mydata: String, groupId: Int) {
        if groupId == 1{
            firstValue = mydata
            print("first value =\(firstValue!)")
            if firstValue == "미졸업" {
                graduate = false
            }
            else if firstValue == "졸업" {
                graduate = true
            }
        }
        else {
            secondValue = mydata
            print("second value =\(secondValue!)")
            if secondValue == nil {
                mainMajorButton.removeFromSuperview()
                subMajorButton.removeFromSuperview()
            }
            else if secondValue == "전공 미선택"{
                mainMajorButton.removeFromSuperview()
                subMajorButton.removeFromSuperview()
                department = true
                major_minor = false
                double_major = false
            }
            else if secondValue == "주/부전공" {
                addSubviews(mainMajorButton, subMajorButton)
                
                mainMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(37)
                    $0.leading.equalToSuperview().inset(28)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
                
                subMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(37)
                    $0.trailing.equalToSuperview().inset(29)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
                department = false
                major_minor = true
                double_major = false
            }
            else if secondValue == "복수전공"{
                addSubviews(mainMajorButton, subMajorButton)
                
                mainMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(37)
                    $0.leading.equalToSuperview().inset(28)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
                
                subMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(37)
                    $0.trailing.equalToSuperview().inset(29)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
                department = false
                major_minor = false
                double_major = true
            }
        }
    }
    
        // MARK: - Delegate Property
        
    weak var delegate : SignUpViewDelegate?
        private var semesterDropdownMenu: CustomDropdownMenuView?
        private var mainMajorDropdownMenu: CustomDropdownMenuView?
        private var subMajorDropdownMenu: CustomDropdownMenuView?


        private var graduate: Bool?
        private var department: Bool?
        private var major_minor: Bool?
        private var double_major: Bool?
        private var firstValue: String?
        private var secondValue: String?
        
        
        // MARK: - UI Components
    
    
    private let contentScrollView = UIScrollView()
        private let mainImage = UIImageView()
        private let nameTextField = UITextField()
        private let nicknameTextField = UITextField()
        private let nicknameCheckButton = UIButton()
        private let nicknameWarningMessage = UILabel()
        private let emailTextField = UITextField()
        private let emailCheckButton = UIButton()
        private let emailWarningMessage = UILabel()
        private let pwTextField = UITextField()
        private let pwReTextField = UITextField()
        private let pwWarningMessage = UILabel()
        private let semesterLabel = UILabel()
        private var semesterButton = UIButton(type: .system)
        private let graduateLabel = UILabel()
        private let graduateRadioButton = RadioButtonsStack(groupId: 1)
        private let majorLabel = UILabel()
        private let majorRadioButton = RadioButtonsStack(groupId: 2)
        private var mainMajorButton = UIButton(type: .system)
        private var subMajorButton = UIButton(type: .system)
        private let signUpButton = UIButton()

        // MARK: - Getter
    var graduateReturn: Bool? {
        return graduate
    }
    var departmentReturn: Bool? {
        return department
    }
    var majorminorReturn: Bool? {
        return major_minor
    }
    var doublemajorReturn: Bool? {
        return double_major
    }
    var passwordReturn: String? {
        return pwTextField.text
    }
        var firstValueReturn: String? {
            return firstValue
        }
        var secondValueReturn: String? {
            return secondValue
        }
        var nameTextFieldText: String? {
            return nameTextField.text
        }
        var nicknameTextFieldText: String? {
            return nicknameTextField.text
        }
        var emailTextFieldText: String? {
            return emailTextField.text
        }
            var semesterButtonTitle: String? {
                return semesterButton.titleLabel?.text
        }
            var mainMajorButtonTitle: String? {
                return mainMajorButton.titleLabel?.text
        }
            var subMajorButtonTitle: String? {
                return subMajorButton.titleLabel?.text
        }
    
        // MARK: - Properties

        private var semesterButtonClosure: (() -> Void)?
        private var mainMajorButtonClosure: (() -> Void)?
        private var subMajorButtonClosure: (() -> Void)?
        var signUpButtonHandler: (() -> Void)?
        var forgotButtonnHandler: (() -> Void)?
        var logInButtonnHandler: (() -> Void)?

        // MARK: - Initializer

        override init(frame: CGRect) {
            super.init(frame: frame)
            setUI()
            setLayout()
            setupDropdownMenus()
            addTarget()
            graduateRadioButton.delegate = self
            majorRadioButton.delegate = self
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

extension SignUpView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        self.backgroundColor = .white
        pwWarningMessage.isHidden = true
        emailWarningMessage.isHidden = true
        nicknameWarningMessage.isHidden = true
        
        contentScrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
            $0.isDirectionalLockEnabled = true
        }
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        nameTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "이름을 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        nicknameTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        nicknameCheckButton.do {
            $0.setTitle("중복확인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        nicknameWarningMessage.do {
            $0.text = "닉네임 중복 *"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .red
            $0.textAlignment = .center
        }
        
        emailTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        emailCheckButton.do {
            $0.setTitle("이메일 인증", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
        }
        
        emailWarningMessage.do {
            $0.text = "학교 이메일만 가능합니다 *"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .red
            $0.textAlignment = .center
        }
        
        pwTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        pwReTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
            ]
            $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한번 더 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        pwWarningMessage.do {
            $0.text = "비밀번호가 일치하지 않습니다.*"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = .red
            $0.textAlignment = .center
        }
        
        semesterLabel.do {
            $0.text = "학기입력 *"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        semesterButton.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.contentHorizontalAlignment = .left
            $0.setTitleWithLeftPadding("학기를 선택해주세요", for: .normal, leftPadding: 13)
            $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        graduateLabel.do {
            $0.text = "졸업유무 *"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        graduateRadioButton.do {
            let options = ["미졸업", "졸업"]
            $0.set(options)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        majorLabel.do {
            $0.text = "전공유형 *"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        majorRadioButton.do {
            let options = ["전공 미선택", "주/부전공", "복수전공"]
            $0.set(options)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mainMajorButton.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.contentHorizontalAlignment = .left
            $0.setTitleWithLeftPadding("학과1", for: .normal, leftPadding: 13)
            $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        subMajorButton.do {
            $0.backgroundColor = UIColor(hex: "#EFEFEF")
            $0.layer.cornerRadius = 6
            $0.contentHorizontalAlignment = .left
            $0.setTitleWithLeftPadding("학과2", for: .normal, leftPadding: 13)
            $0.setTitleColor(UIColor(hex: "#737373"), for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.layer.backgroundColor = UIColor.black.cgColor
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.setTitleColor(.white, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
            
        addSubview(contentScrollView)
        
        contentScrollView.addSubviews(mainImage, nameTextField, nicknameTextField, nicknameCheckButton, nicknameWarningMessage, emailTextField, emailCheckButton, emailWarningMessage, pwTextField,
                    pwReTextField,pwWarningMessage, semesterLabel, semesterButton, graduateLabel, graduateRadioButton, majorLabel, majorRadioButton, signUpButton)
        contentScrollView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.width.equalTo(234)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        nicknameCheckButton.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(13)
            $0.leading.equalTo(nicknameTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(113)
            $0.height.equalTo(50)
        }
        
        nicknameWarningMessage.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(28)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameWarningMessage.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        emailCheckButton.snp.makeConstraints {
            $0.top.equalTo(nicknameWarningMessage.snp.bottom).offset(5)
            $0.leading.equalTo(emailTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(113)
            $0.height.equalTo(50)
        }
        
        emailWarningMessage.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(28)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailWarningMessage.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
            $0.height.equalTo(50)
        }
        
        pwReTextField.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
            $0.height.equalTo(50)
        }
        
        pwWarningMessage.snp.makeConstraints {
            $0.top.equalTo(pwReTextField.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(28)
        }
        
        semesterLabel.snp.makeConstraints {
            $0.centerY.equalTo(semesterButton.snp.centerY)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(17)
        }
        
        semesterButton.snp.makeConstraints {
            $0.top.equalTo(pwWarningMessage.snp.bottom).offset(32)
            $0.leading.equalTo(semesterLabel.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(262)
            $0.height.equalTo(50)
        }
        
        graduateLabel.snp.makeConstraints {
            $0.top.equalTo(semesterLabel.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(28)
            $0.width.equalTo(63)
            $0.height.equalTo(17)
        }
        
        graduateRadioButton.snp.makeConstraints {
            $0.top.equalTo(semesterLabel.snp.bottom).offset(48)
            $0.leading.equalTo(graduateLabel.snp.trailing).offset(12)
            $0.height.equalTo(17)
        }
        
        
        majorLabel.snp.makeConstraints {
            $0.top.equalTo(graduateLabel.snp.bottom).offset(37)
            $0.leading.equalToSuperview().offset(28)
            $0.width.equalTo(63)
            $0.height.equalTo(17)
        }
        
        majorRadioButton.snp.makeConstraints {
            $0.top.equalTo(graduateLabel.snp.bottom).offset(37)
            $0.trailing.equalToSuperview().inset(29)
            $0.leading.equalTo(majorLabel.snp.trailing).offset(12)
            $0.height.equalTo(17)
        }
        
//        mainMajorButton.snp.makeConstraints {
//            $0.top.equalTo(majorLabel.snp.bottom).offset(37)
//            $0.leading.equalToSuperview().inset(28)
//            $0.width.equalTo(140)
//            $0.height.equalTo(50)
//        }
//
//        subMajorButton.snp.makeConstraints {
//            $0.top.equalTo(majorLabel.snp.bottom).offset(37)
//            $0.trailing.equalToSuperview().inset(29)
//            $0.width.equalTo(140)
//            $0.height.equalTo(50)
//        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(majorRadioButton.snp.bottom).offset(120)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(48)
            
        }
    }
    
    // MARK: - Methods
    
    /// 이메일의 참/부정 요소를 평가하는 함수
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@office.skhu.ac.kr"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with:str)
    }
    
    func handleOptionSelected(_ option: String) {
        print("Selected option: \(option)")
    }
    
    private func setupDropdownMenus() {
        let semesterOptions = ["1학기", "2학기", "3학기", "4학기", "5학기", "6학기", "7학기", "8학기"]
        semesterDropdownMenu = CustomDropdownMenuView(options: semesterOptions, parentButton: semesterButton)
        semesterDropdownMenu?.delegate = self
        
        let mainMajorOptions = ["컴퓨터공학", "소프트웨어공학", "정보통신공학", "인공지능"]
        mainMajorDropdownMenu = CustomDropdownMenuView(options: mainMajorOptions, parentButton: mainMajorButton)
        mainMajorDropdownMenu?.delegate = self
        
        let subMajorOptions = ["컴퓨터공학", "소프트웨어공학", "정보통신공학", "인공지능"]
        subMajorDropdownMenu = CustomDropdownMenuView(options: subMajorOptions, parentButton: subMajorButton)
        subMajorDropdownMenu?.delegate = self
    }
    
    private func addTarget() {
        
        nicknameCheckButton.addTarget(self, action: #selector(nicknameCheckButtonTapped), for: .touchUpInside)
        emailCheckButton.addTarget(self, action: #selector(emailCheckButtonTapped), for: .touchUpInside)
        semesterButton.addTarget(self, action: #selector(semesterButtonTapped), for: .touchUpInside)
        mainMajorButton.addTarget(self, action: #selector(mainMajorButtonTapped), for: .touchUpInside)
        subMajorButton.addTarget(self, action: #selector(subMajorButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
        func dropdownMenuDidSelectOption(_ option: String, for button: UIButton) {
            print("Selected Option for button:", option)
        }
    
    // MARK: - @objc Methods
    @objc
    func nicknameCheckButtonTapped() {
        self.delegate?.nicknameCheckButtonTapped()
    }
    @objc
    func emailCheckButtonTapped() {
        if let email = emailTextField.text {
            if checkEmail(str: email) {
                // 입력값이 유효한 이메일 주소일 경우
                self.delegate?.emailCheckButtonTapped()
            }
            else {
                emailWarningMessage.isHidden = false
                // 입력값이 유효하지 않은 이메일 주소일 경우
            }
        }
    }
    @objc
    func signUpButtonTapped() {
        self.delegate?.signUpButtonTapped()
    }
    
    @objc func testprint() {
        print("눌리네요~")
    }
    
    @objc func showSelectBox() {
        // 이 메서드는 버튼을 누를 때 UIMenu가 표시됩니다.
    }
    
    @objc private func semesterButtonTapped() {
        if let menu = semesterDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.bottom.equalTo(semesterButton.snp.top).offset(8)
                    make.leading.trailing.equalTo(semesterButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        mainMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        subMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
    }
    
    @objc private func mainMajorButtonTapped() {
        if let menu = mainMajorDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.bottom.equalTo(mainMajorButton.snp.top).offset(8)
                    make.leading.trailing.equalTo(mainMajorButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        semesterDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        subMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        
    }
    
    @objc private func subMajorButtonTapped() {
        if let menu = subMajorDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.bottom.equalTo(subMajorButton.snp.top).offset(8)
                    make.leading.trailing.equalTo(subMajorButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        semesterDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        mainMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
    }
}
