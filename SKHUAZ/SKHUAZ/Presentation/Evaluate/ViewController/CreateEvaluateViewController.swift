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
    private let evaluateView = CreateEvaluateView()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
//        setNavigation()
        setupKeyboardEvent()
        setTapScreen()
        addTarget()
    }
}

extension CreateEvaluateViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        cancelButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("목록", for: .normal)
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#000000")
            $0.setTitle("저장", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainImage, evaluateView, cancelButton, saveButton)
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        evaluateView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(640)
            $0.width.equalTo(315)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(evaluateView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(39)
            $0.width.equalTo(77)
            $0.height.equalTo(30)
        }
    
        saveButton.snp.makeConstraints {
            $0.top.equalTo(evaluateView.snp.bottom).offset(25)
            $0.trailing.equalToSuperview().inset(39)
            $0.width.equalTo(77)
            $0.height.equalTo(30)
        }
    }
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        cancelButton.addTarget(self, action: #selector(pushToEvaluateViewController), for: .touchUpInside)
    }

    
    private func setTapScreen() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tapGestureRecognizer)
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
    private func didTapScreen() {
        view.endEditing(true)
    }
    
    @objc
    private func pushToEvaluateViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
