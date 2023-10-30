//
//  EditProfileView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/19.
//

import UIKit

import SnapKit
import Then

class EditProfileView: UIView, SendStringData, DropdownMenuDelegate{

    func sendData(mydata: String, groupId: Int) {
        if groupId == 1{
            firstValue = mydata
            print("first value =\(firstValue!)")
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
            }
            else {
                addSubviews(mainMajorButton, subMajorButton)
                
                mainMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(27)
                    $0.leading.equalToSuperview().inset(28)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
                
                subMajorButton.snp.makeConstraints {
                    $0.top.equalTo(majorLabel.snp.bottom).offset(27)
                    $0.trailing.equalToSuperview().inset(29)
                    $0.width.equalTo(140)
                    $0.height.equalTo(50)
                }
            }
        }
    }
    
    // MARK: - Delegate Property

    private var semesterDropdownMenu: CustomDropdownMenuView?
    private var mainMajorDropdownMenu: CustomDropdownMenuView?
    private var subMajorDropdownMenu: CustomDropdownMenuView?

    private var firstValue: String?
    private var secondValue: String?
    
    // MARK: - UI Components

    private let profileImage = UIImageView()
    private let nameTextField = UITextField()
    private let nicknameTextField = UITextField()
    private let nicknameCheckButton = UIButton()
    private let semesterLabel = UILabel()
    private var semesterButton = UIButton(type: .system)
    private let graduateLabel = UILabel()
    private let graduateRadioButton = RadioButtonsStack(groupId: 1)
    private let majorLabel = UILabel()
    private let majorRadioButton = RadioButtonsStack(groupId: 2)
    private var mainMajorButton = UIButton(type: .system)
    private var subMajorButton = UIButton(type: .system)
    private let saveButton = UIButton()

    // MARK: - Getter

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
    
    var token: String = UserDefaults.standard.string(forKey: "AuthToken")!

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
        setUserData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditProfileView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        self.backgroundColor = .white
        
        profileImage.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
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
            $0.addTarget(self,
                         action: #selector(nicknameCheckButtonTapped),
                         for: .touchUpInside)
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
            $0.set(options, defaultSelection: "미졸업")
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
            $0.set(options, defaultSelection: "전공 미선택")
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
        saveButton.do {
            $0.setTitle("저장", for: .normal)
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
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(profileImage, nameTextField, nicknameTextField, nicknameCheckButton, semesterLabel, semesterButton, graduateLabel, graduateRadioButton, majorLabel, majorRadioButton, saveButton)
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.width.equalTo(234)
            $0.height.equalTo(60)
            $0.centerX.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        nicknameCheckButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(50)
            $0.leading.equalTo(nicknameTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(29)
            $0.width.equalTo(113)
            $0.height.equalTo(50)
        }
        
        semesterLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(17)
        }
        
        semesterButton.snp.makeConstraints {
            $0.centerY.equalTo(semesterLabel.snp.top)
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
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(majorRadioButton.snp.bottom).offset(102)
            $0.leading.equalToSuperview().inset(28)
            $0.trailing.equalToSuperview().inset(29)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
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
        
        semesterButton.addTarget(self, action: #selector(semesterButtonTapped), for: .touchUpInside)
        mainMajorButton.addTarget(self, action: #selector(mainMajorButtonTapped), for: .touchUpInside)
        subMajorButton.addTarget(self, action: #selector(subMajorButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(pushSecondViewController), for: .touchUpInside)
    }
    
    private func setUserData() {
        nicknameTextField.text = UserDefaults.standard.string(forKey: "Nickname")
        semesterButton.setTitleWithLeftPadding(UserDefaults.standard.string(forKey: "Semester"), for: .normal, leftPadding: 13)
        semesterButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        setGraduateRadioButton()
        setMajorRadioButton()
    }
    
    private func setGraduateRadioButton() {
        let options = ["미졸업", "졸업"]
        if UserDefaults.standard.bool(forKey: "Graduate") {
            graduateRadioButton.set(options, defaultSelection: "졸업")
        } else {
            graduateRadioButton.set(options, defaultSelection: "미졸업")
        }
    }
    
    private func setMajorRadioButton() {
        let options = ["전공 미선택", "주/부전공", "복수전공"]
        if UserDefaults.standard.bool(forKey: "department") {
            majorRadioButton.set(options, defaultSelection: "전공 미선택")
            sendData(mydata: "전공 미선택", groupId: 2)
        } else if UserDefaults.standard.bool(forKey: "MajorMinor") {
            majorRadioButton.set(options, defaultSelection: "주/부전공")
            sendData(mydata: "복수전공", groupId: 2)
            mainMajorButton.setTitleWithLeftPadding(UserDefaults.standard.string(forKey: "Major1"), for: .normal, leftPadding: 13)
            mainMajorButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            subMajorButton.setTitleWithLeftPadding(UserDefaults.standard.string(forKey: "Major2"), for: .normal, leftPadding: 13)
            subMajorButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        } else if UserDefaults.standard.bool(forKey: "DoubleMajor") {
            majorRadioButton.set(options, defaultSelection: "복수전공")
            sendData(mydata: "복수전공", groupId: 2)
            mainMajorButton.setTitleWithLeftPadding(UserDefaults.standard.string(forKey: "Major1"), for: .normal, leftPadding: 13)
            mainMajorButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            subMajorButton.setTitleWithLeftPadding(UserDefaults.standard.string(forKey: "Major2"), for: .normal, leftPadding: 13)
            subMajorButton.setTitleColor(UIColor(hex: "#000000"), for: .normal)
        }
        
        
    }
    
    func dropdownMenuDidSelectOption(_ option: String, for button: UIButton) {
        print("Selected Option for button is:", option)
    }
    
    // MARK: - @objc Methods
    
    @objc
    func pushSecondViewController() {
        EditProfile()
    }
    
    @objc func testprint() {
        print("눌리네요~")
    }
    
    @objc func showSelectBox() {
        // 이 메서드는 버튼을 누를 때 UIMenu가 표시됩니다.
    }
    @objc func nicknameCheckButtonTapped() {
        nicknameCheck()
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
        mainMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        subMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        
    }
    
    @objc private func mainMajorButtonTapped() {
        if let menu = mainMajorDropdownMenu {
            if menu.superview == nil {
                addSubviews(menu)
                
                menu.snp.makeConstraints { make in
                    make.top.equalTo(mainMajorButton.snp.bottom).offset(8)
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
                    make.top.equalTo(subMajorButton.snp.bottom).offset(8)
                    make.leading.trailing.equalTo(subMajorButton)
                }
            } else {
                menu.removeFromSuperview()
            }
        }
        semesterDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
        mainMajorDropdownMenu?.removeFromSuperview() // 다른 드롭다운 메뉴가 열려있으면 닫음
    }
    
    func nicknameCheck() {
        UserAPI.shared.nicknameCheck(nickname: nicknameTextField.text ?? "") { result in
            switch result {
            case .success:
                print("nickname checked Success")
            case .requestErr(let message):
                // Handle request error here.
                print("Request error: \(message)")
            case .pathErr:
                // Handle path error here.
                print("Path error")
            case .serverErr:
                // Handle server error here.
                print("Server error")
            case .networkFail:
                // Handle network failure here.
                print("Network failure")
            default:
                break
            }
        }
    }
    
    func EditProfile() {
        UserAPI.shared.editProfile(request: EditProfileRequest.init(nickname: nicknameTextField.text ?? "", semester: semesterButtonTitle ?? "", graduate: false, major1: mainMajorButtonTitle ?? "", major2: subMajorButtonTitle ?? "", department: false, majorMinor: true, doubleMajor: false), token: token)
        { result in
            switch result {
            case .success:
                print("Sign Up Success")
            case .requestErr(let message):
                // Handle request error here.
                print("Request error: \(message)")
            case .pathErr:
                // Handle path error here.
                print("Path error")
            case .serverErr:
                // Handle server error here.
                print("Server error")
            case .networkFail:
                // Handle network failure here.
                print("Network failure")
            default:
                break
            }
        }
    }
}
