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
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setupKeyboardEvent()
        setNavigation()
        addTarget()
        self.hideKeyboardWhenTappedAround()
    }
}

extension CreateEvaluateViewController:  CreateEvaluateBottomSheetViewControllerDelegate {
    
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
//            $0.backgroundColor = UIColor(hex: "#FFFFFF")
//            $0.setTitle("뒤로가기", for: .normal)
//            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
//            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        
        saveButton.do {
            $0.setImage(Image.save, for: .normal)
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
    
    // MARK: - Methods
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(popToEvaluateViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(presnetToCreateEvaluateBottomSheetViewController), for: .touchUpInside)
    }
    // MARK: - Methods
    
        private func addTarget() {
            cancelButton.addTarget(self, action: #selector(pushToRecommendViewController), for: .touchUpInside)
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
    private func pushToRecommendViewController() {
    private func popToEvaluateViewController() {
    private func pushToRecommendViewController() {
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
            UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
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

