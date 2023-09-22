//
//  EssentialBottomSheetViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/14.
//

import UIKit

import SnapKit
import Then

final class EssentialBottomSheetViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    weak var delegate: CreateEvaluateViewController?
    private let titleText: String = "{글제목}"
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
}

extension EssentialBottomSheetViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.preferredCornerRadius = 20
            sheetPresentationController.prefersGrabberVisible = true
            sheetPresentationController.detents = [.custom {context in
                return 307
            }]
        }
        
        titleLabel.do {
            $0.text = "{학기} 선택을 마치고\n{다음학기}로 넘어가시겠습니까?"
            $0.textColor = UIColor(hex: "#000000")
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 15)
            $0.textAlignment = .center
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
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, cancelButton, saveButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(203)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(75)
            $0.leading.equalToSuperview().offset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(75)
            $0.trailing.equalToSuperview().inset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        cancelButton.addTarget(self, action: #selector(dismissToCreateEvaluateViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveEvaluate), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func dismissToCreateEvaluateViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func saveEvaluate() {
        print("저장버튼이 눌렸습니다")
        self.dismiss(animated: false) { [weak self] in
            self?.delegate?.didTapSaveButton() {
                let customAlertVC = AlertViewController(alertType: .mainEvaluate)
                customAlertVC.modalPresentationStyle = .overFullScreen
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let mainWindow = windowScene.windows.first {
                    mainWindow.rootViewController?.present(customAlertVC, animated: false, completion: nil)
                }
            }
        }
    }
}
