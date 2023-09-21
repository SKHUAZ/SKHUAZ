//
//  CreateEvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/06.
//

import UIKit

import SnapKit
import Then

final class CreateEvaluateViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let mainImage = UIImageView()
    private let evaluateView = EvaluateView(frame: .zero, evaluateType: .createEvalute)
    private let backButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    private var semesterOptions: [String] = ["23 - 1학기", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
    private var lectureOptions: [String] = ["C 프로그래밍", "이산수학", "Python 프로그래밍", "데이터베이스", "사물인터넷 기초", "Java 프로그래밍", "논리회로설계", "웹 개발 입문", "데이터기초수학", "전공탐색세미나 (컴퓨터공학전공)", "전공탐색세미나 (소프트웨어공학전공)", "전공탐색세미나 (인공지능전공)"]
    private var profeserOptions: [String] = ["1", "1", "1", "1", "1"]
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setupKeyboardEvent()
        setNavigation()
        addTarget()
        setDelagate()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(semesterTitleChanged(_:)), name: NSNotification.Name("SemesterTitleChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(lectureTitleChanged(_:)), name: NSNotification.Name("LectureTitleChanged"), object: nil)
    }
}

extension CreateEvaluateViewController:  CreateEvaluateBottomSheetViewControllerDelegate {
    @objc
    private func semesterTitleChanged(_ notification: Notification) {
        if let newTitle = notification.userInfo?["newTitle"] as? String {
            print("\(newTitle)를 서버에 넣어야합니다 이건 선택한 학기입니다")
            evaluateView.setDropDownLectureMenu(lectureOptions: lectureOptions)
        }
    }
    
    @objc
    private func lectureTitleChanged(_ notification: Notification) {
        if let newTitle = notification.userInfo?["newTitle"] as? String {
            print("\(newTitle)을 서버에 넣어야합니다 이건 선택한 강의입니다")
            evaluateView.setDropDownProfessorMenu(profeserOptions: profeserOptions)
        }
    }
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        backButton.do {
            $0.setImage(Image.vector, for: .normal)
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
        }
        
        saveButton.do {
            $0.setImage(Image.save, for: .normal)
        }
        
        evaluateView.do {
            $0.setDropDownSemesterMenus(semesterOptions: semesterOptions)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainImage, evaluateView, backButton, saveButton)
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(19)
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        evaluateView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(690)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
    }
    
    private func setDelagate(){
    }
    
    // MARK: - Methods
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(popToEvaluateViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(presnetToCreateEvaluateBottomSheetViewController), for: .touchUpInside)
    }
    
    
    private func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    func didTapSaveButton(completion: @escaping () -> Void) {
        self.navigationController?.popToRootViewController(animated: false)
        completion()
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentResponder as? UITextField else { return }
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let keyboardOverlap = textFieldBottomY - keyboardTopY
            view.frame.origin.y = -keyboardOverlap - 40
        }
    }
    
    @objc
    private func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    @objc
    private func popToEvaluateViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func presnetToCreateEvaluateBottomSheetViewController() {
        
        if (evaluateView.semesterButtonTitle == "학기를 선택해주세요" || evaluateView.propeserButtonTitle == "교수님을 선택해주세요" ||
            evaluateView.lectureButtonTitle == "강의를 선택해주세요" || evaluateView.titleTextFieldText == nil ||
            evaluateView.evaluateViewText == "본문을 작성해주세요") {
            print("입려을 다 해주세요")
            let customAlertVC = AlertViewController(alertType: .createEvaluate)
            customAlertVC.modalPresentationStyle = .overFullScreen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let mainWindow = windowScene.windows.first {
                mainWindow.rootViewController?.present(customAlertVC, animated: false, completion: nil)
            }

        } else {
            print("Semester Button Title : \(evaluateView.semesterButtonTitle ?? "")")
            print("Propeser Button Title : \(evaluateView.propeserButtonTitle ?? "")")
            print("Lecture Button Title : \(evaluateView.lectureButtonTitle ?? "")")
            print("Title Text Field Text : \(evaluateView.titleTextFieldText ?? "")")
            print("Evaluate View Text : \(evaluateView.evaluateViewText ?? "")")
            
            print("First Slider Value : \(evaluateView.firstSliderValue)")
            print("Second Slider Value : \(evaluateView.secondSliderValue)")
            print("Third Slider Value : \(evaluateView.thirdSliderValue)")
            print("Fourth Slider Value : \(evaluateView.fourthSliderValue)")
            let bottomSheetVC = CreateEvaluateBottomSheetViewController()
            bottomSheetVC.delegate = self
            present(bottomSheetVC, animated: true, completion: nil)
        }
    }
}
