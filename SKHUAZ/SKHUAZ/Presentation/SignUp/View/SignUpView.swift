//
//  SignUpView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

import SnapKit
import Then

final class SignUpView: UIView {

        // MARK: - UI Components

        private let logoLabel = UILabel()
        private let nameTextField = UITextField()
        private let nicknameTextField = UITextField()
        private let nicknameCheckButton = UIButton()
        private let studentIDTextField = UITextField()
        private let studentIDCheckButton = UIButton()
        private let pwTextField = UITextField()
        private let pwReTextField = UITextField()
        private let semesterLabel = UILabel()
        private let semesterMenu = UIButton()
        private let graduateLabel = UILabel()
    private let graduateRadioButton = RadioButtonsStack()
        private let majorLabel = UILabel()
    private let majorRadioButton = RadioButtonsStack()
        private let mainDepartmentMenu = UIButton()
        private let subDepartmentMenu = UIButton()
        private let signUpButton = UIButton()
        private let testView = RepetitionCheckView(placeholder: "닉네임을 입력해주세요", buttonTilte: "중복확인")

        // MARK: - Properties

        var signUpButtonHandler: (() -> Void)?
        var forgotButtonnHandler: (() -> Void)?
        var logInButtonnHandler: (() -> Void)?

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

extension SignUpView {

    // MARK: - UI Components Property

    private func setUI() {
        self.backgroundColor = .white

        logoLabel.do {
            $0.text = "SKHUAZ"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .blue
            $0.textAlignment = .center
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
            $0.addTarget(self,
                         action: #selector(pushSecondViewController),
                         for: .touchUpInside)
        }
        
        studentIDTextField.do {
            let attributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont.systemFont(ofSize: 14), // 원하는 폰트 크기로 설정
                        .foregroundColor: UIColor.appColor(.placeHolderColor) // 원하는 폰트 색상 설정
                    ]
            $0.attributedPlaceholder = NSAttributedString(string: "학번을 입력해주세요 * ", attributes: attributes)
            $0.font = .systemFont(ofSize:14)
            $0.backgroundColor = UIColor.appColor(.placeHolderBackgroundColor)
            $0.layer.borderColor = UIColor.appColor(.placeHolderBackgroundColor).cgColor
            $0.clearButtonMode = .whileEditing
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 5
            $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
            $0.leftViewMode = .always
        }
        
        studentIDCheckButton.do {
            $0.setTitle("중복확인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.addTarget(self,
                         action: #selector(pushSecondViewController),
                         for: .touchUpInside)
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

        semesterLabel.do {
            $0.text = "학기입력 *"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
            $0.textAlignment = .center
        }

//        semesterMenu.do {
//            $0.addTarget(self, action: #selector(setSemesterSelectBox(_:)), for: .touchUpInside)
//        }

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
        
//        mainDepartmentMenu.do {
//            $0.addTarget(self, action: #selector(setSemesterSelectBox(_:)), for: .touchUpInside)
//        }
//
//        subDepartmentMenu.do {
//            $0.addTarget(self, action: #selector(setSemesterSelectBox(_:)), for: .touchUpInside)
//        }
        signUpButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.layer.backgroundColor = UIColor.black.cgColor
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self,
                         action: #selector(pushSecondViewController),
                         for: .touchUpInside)
        }
//        testView.do {
//            $0.backButton.addTarget(self,
//                                    action: #selector(pushSecondViewController),
//                                    for: .touchUpInside)
//        }
    }

    // MARK: - Layout Helper

    private func setLayout() {
        
        addSubviews(logoLabel, nameTextField, nicknameTextField, nicknameCheckButton, studentIDTextField, studentIDCheckButton,pwTextField,
                    pwReTextField, semesterLabel, semesterMenu, graduateLabel, graduateRadioButton, majorLabel, majorRadioButton, mainDepartmentMenu, subDepartmentMenu, signUpButton)

        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.width.equalTo(234)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }

        nameTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(25)
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
        
        studentIDTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        studentIDCheckButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(32)
            $0.leading.equalTo(studentIDTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(113)
            $0.height.equalTo(50)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(studentIDTextField.snp.bottom).offset(13)
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

        semesterLabel.snp.makeConstraints {
            $0.top.equalTo(pwReTextField.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(17)
        }
        
        semesterMenu.snp.makeConstraints {
            $0.top.equalTo(pwReTextField.snp.bottom).offset(48)
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

        mainDepartmentMenu.snp.makeConstraints {
            $0.top.equalTo(majorLabel.snp.bottom).offset(37)
            $0.leading.equalToSuperview().inset(28)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }

        subDepartmentMenu.snp.makeConstraints {
            $0.top.equalTo(majorLabel.snp.bottom).offset(37)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }

        signUpButton.snp.makeConstraints {
            $0.top.equalTo(subDepartmentMenu.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(48)

        }
    }

    // MARK: - Methods

    func handleOptionSelected(_ option: String) {
        print("Selected option: \(option)")
    }

    func setupSelectBox(_ selectButton: UIButton) {
            // 옵션들을 나타내는 UIMenu 생성
            let option1 = UIAction(title: "Option 1", image: nil) { _ in
                self.handleOptionSelected("Option 1")
            }

            let option2 = UIAction(title: "Option 2", image: nil) { _ in
                self.handleOptionSelected("Option 2")
            }

            let menu = UIMenu(title: "Select an Option", children: [option1, option2])

            // 버튼 생성
            let selectButton = UIButton(type: .system)
            selectButton.setTitle("Select", for: .normal)
            selectButton.addTarget(self, action: #selector(showSelectBox), for: .touchUpInside)
            selectButton.frame = CGRect(x: 50, y: 50, width: 100, height: 40)

            // UIMenu와 버튼 연결
            selectButton.showsMenuAsPrimaryAction = true
            selectButton.menu = menu
        }

    // MARK: - @objc Methods

    @objc
    func pushSecondViewController() {

    }

    @objc func showSelectBox() {
            // 이 메서드는 버튼을 누를 때 UIMenu가 표시됩니다.
        }
}
