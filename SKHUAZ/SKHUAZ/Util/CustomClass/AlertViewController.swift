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
    case nuSelectDataStructure
    case save
    case logout
    case admin
    case writer
    case unWriter
}

final class AlertViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let alertView = UIView()
    private let mainLabel = UILabel()
    private let checkButton = UIButton()
    private let cancelButton = UIButton()
    private let lectureNameTextField = UITextField()
    private let professorNameTextField = UITextField()
    private let essentialNameTextField = UITextField()
    private let semesterTextField = UITextField()
    private let warringLabel = UILabel()
    
    // MARK: - Properties
    
    private let alertType: CustomAlertType
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(hex: "#737373"),
    ]
    
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
            
        case .nuSelectDataStructure:
            mainLabel.do {
                $0.text = "선수과목인 자료구조를\n담지 않았습니다"
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
            
        case .save:
            mainLabel.do {
                $0.text = "선수과목제도\n저장이 완료되었습니다"
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
            
        case .logout:
            mainLabel.do {
                $0.text = "로그아웃이 완료되었습니다."
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
            
        case .admin:
            
            mainLabel.do {
                $0.text = "선수과목 추가"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
                $0.numberOfLines = 2
            }
            
            lectureNameTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "강의명을 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
            }
            
            professorNameTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "교수명을 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
            }
            
            semesterTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "학기를 입력해주세요", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
            }
            
            essentialNameTextField.do {
                $0.font = .systemFont(ofSize: 15)
                $0.textColor = .black
                $0.backgroundColor = UIColor(hex: "#EFEFEF")
                $0.layer.cornerRadius = 6
                $0.attributedPlaceholder = NSAttributedString(string: "해당 과목의 선수과목", attributes: attributes)
                let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
                $0.leftViewMode = .always
                $0.leftView = paddingView
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
            
        case .unWriter:
            mainLabel.do {
                $0.text = "삭제 권한이 없습니다"
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

            
        case .writer:
            mainLabel.do {
                $0.text = "정말 삭제하시겠습니까?"
                $0.textAlignment = .center
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 15)
            }
            
            cancelButton.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
                $0.layer.borderWidth = 1
                $0.backgroundColor = UIColor(hex: "#FFFFFF")
                $0.setTitle("취소", for: .normal)
                $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 15)
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
        
        switch alertType {
        case .logout, .save, .nuSelectDataStructure, .unSelectLecture, .unSelectSemester, .createEvaluate, .mainEvaluate, .unWriter:
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
            
        case .writer:
            view.addSubview(alertView)
            
            alertView.addSubviews(
                mainLabel,
                cancelButton,
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
            
            cancelButton.snp.makeConstraints {
                $0.top.equalTo(mainLabel.snp.bottom).offset(30)
                $0.leading.equalToSuperview().inset(50)
                $0.width.equalTo(87)
                $0.height.equalTo(34)
            }
            
            
            checkButton.snp.makeConstraints {
                $0.top.equalTo(mainLabel.snp.bottom).offset(30)
                $0.trailing.equalToSuperview().inset(50)
                $0.width.equalTo(87)
                $0.height.equalTo(34)
            }
        case .admin:
            view.addSubview(alertView)
            
            alertView.addSubviews(
                mainLabel,
                lectureNameTextField,
                professorNameTextField,
                semesterTextField,
                essentialNameTextField,
                checkButton
            )
            
            alertView.snp.makeConstraints {
                $0.width.equalTo(300)
                $0.height.equalTo(340)
                $0.center.equalToSuperview()
            }
            
            mainLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(20)
                $0.leading.equalToSuperview().offset(40)
            }
            
            lectureNameTextField.snp.makeConstraints {
                $0.top.equalTo(mainLabel.snp.bottom).offset(20)
                $0.leading.trailing.equalToSuperview().inset(40)
                $0.height.equalTo(40)

            }
            
            
            professorNameTextField.snp.makeConstraints {
                $0.top.equalTo(lectureNameTextField.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview().inset(40)
                $0.height.equalTo(40)
            }
            
            semesterTextField.snp.makeConstraints {
                $0.top.equalTo(professorNameTextField.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview().inset(40)
                $0.height.equalTo(40)
            }
            
            essentialNameTextField.snp.makeConstraints {
                $0.top.equalTo(semesterTextField.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview().inset(40)
                $0.height.equalTo(40)
            }
            
            checkButton.snp.makeConstraints {
                $0.bottom.equalTo(alertView.snp.bottom).offset(-18)
                $0.leading.equalToSuperview().offset(107)
                $0.width.equalTo(87)
                $0.height.equalTo(34)
            }
        }
 
        
    }
    
    // MARK: - Methodes
    
    private func addTarget() {
        switch alertType {
        case.save, .nuSelectDataStructure, .unSelectLecture, .unSelectSemester, .createEvaluate, .mainEvaluate, .admin, .unWriter:
            checkButton.addTarget(self, action: #selector(touchdeleteButton), for: .touchUpInside)
        case .logout:
            checkButton.addTarget(self, action: #selector(touchLogoutComplete), for: .touchUpInside)
        case .writer:
            cancelButton.addTarget(self, action: #selector(touchdeleteButton), for: .touchUpInside)
        }
    }
    
    func setCheckButtonAction(target: Any?, action: Selector) {
        checkButton.addTarget(target, action: action, for: .touchUpInside)
    }

    
    private func pushToLoginView() {
            let loginVC = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowScene.delegate as? SceneDelegate {
                delegate.window?.rootViewController = navigationController
            }
        }
    
    // MARK: - @objc Methods
    
    @objc
    private func touchdeleteButton() {
        dismiss(animated: false, completion: nil)
    }
    
    @objc
    private func touchLogoutComplete() {
        dismiss(animated: false, completion: nil)
        self.pushToLoginView()
    }
}

