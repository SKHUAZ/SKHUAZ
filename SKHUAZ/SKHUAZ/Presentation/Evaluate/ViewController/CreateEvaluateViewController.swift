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
    private let warringLabel = UILabel()
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
        
        warringLabel.do {
            $0.text = "평가 영역에 입력한 수의 합이 총 100이 되도록 작성해주세요."
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = UIColor(hex: "#ED7A7A")
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
        view.addSubviews(mainImage, evaluateView, warringLabel, backButton, saveButton)
        
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
        
        warringLabel.snp.makeConstraints {
            $0.top.equalTo(evaluateView.snp.bottom).inset(10)
            $0.centerX.equalToSuperview()
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
//        print(evaluateView.evaluateView.text)
        let bottomSheetVC = CreateEvaluateBottomSheetViewController()
        bottomSheetVC.delegate = self
        present(bottomSheetVC, animated: true, completion: nil)
    }
}

