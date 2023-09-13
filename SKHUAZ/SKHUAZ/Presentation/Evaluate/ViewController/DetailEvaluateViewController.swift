//
//  DetailEvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/08.
//

import UIKit

import SnapKit
import Then

class DetailEvaluateViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let mainImage = UIImageView()
    private let detailEvaluateView = EvaluateView(frame: .zero, evaluateType: .detailEvalute)
    private let backButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        self.hideKeyboardWhenTappedAround()
        addTarget()
        if let evaluateView = detailEvaluateView as? EvaluateView {
            evaluateView.setDetailEvaluateView(semester: "상세보기기지롱", professor: "상세보보기기", lecture: "천성우", title: "우성천의 승리", evaluate: "이거 100자 제한 해야하는데", firstPoint: 60, secondPoint: 40, thirdPoint: 20, fourtPoint: 90)
        }
    }
}

extension DetailEvaluateViewController {

    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        backButton.do {
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
            $0.setTitle("아마삭제", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainImage, detailEvaluateView, backButton, saveButton)
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(19)
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        detailEvaluateView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(640)
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
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(popToEvaluateViewController), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func popToEvaluateViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
