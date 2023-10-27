//
//  CreateRecommendBottomSheetViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/16.
//

import UIKit

import SnapKit
import Then

protocol CreateRecommendBottomSheetViewControllerDelegate: AnyObject {
    func didTapSaveButton(completion: @escaping () -> Void)
}

final class CreateRecommendBottomSheetViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let saveViewTitleLabel = UILabel()
    private let saveViewCancelButton = UIButton()
    private let saveViewSaveButton = UIButton()
    
    // MARK: - Properties
    
    weak var delegate: CreateRecommendViewController?
    private let titleText: String = "{글제목}"
    
    var requestRecommendDataBind = CreateRecommendRequestBody()
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
}

extension CreateRecommendBottomSheetViewController {
    
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
        
        saveViewTitleLabel.do {
            $0.text = "저장하시겠습니까?"
            $0.textColor = UIColor(hex: "#000000")
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 15)
            $0.textAlignment = .center
        }
        
        saveViewCancelButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        saveViewSaveButton.do {
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
        view.addSubviews(saveViewTitleLabel, saveViewCancelButton, saveViewSaveButton)
        
        saveViewTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.leading.trailing.equalToSuperview().inset(137)
        }
        
        saveViewCancelButton.snp.makeConstraints {
            $0.top.equalTo(saveViewTitleLabel.snp.bottom).offset(75)
            $0.leading.equalToSuperview().offset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
        
        saveViewSaveButton.snp.makeConstraints {
            $0.top.equalTo(saveViewTitleLabel.snp.bottom).offset(75)
            $0.trailing.equalToSuperview().inset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        saveViewCancelButton.addTarget(self, action: #selector(dismissToCreateRecommendViewController), for: .touchUpInside)
        saveViewSaveButton.addTarget(self, action: #selector(saveRootRecommend), for: .touchUpInside)
    }
    
    func dataBind(data: CreateRecommendRequestBody) {
        self.requestRecommendDataBind = data
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func dismissToCreateRecommendViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func saveRootRecommend() {
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
