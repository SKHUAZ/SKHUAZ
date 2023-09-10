//
//  CreateRecommendViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/07.
//

import UIKit
import SnapKit
import Then

final class CreateRecommendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let recommendView = CreateRecommendView()
    private let logoImage = UIImageView()
    private let listButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
}

extension CreateRecommendViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        logoImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        listButton.do {
//            $0.layer.cornerRadius = 6
//            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
//            $0.layer.borderWidth = 1
//            $0.backgroundColor = UIColor(hex: "#FFFFFF")
//            $0.setTitle("목록", for: .normal)
//            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
//            $0.titleLabel?.font = .systemFont(ofSize: 8)
            $0.setImage(Image.List, for: .normal)
        }
        
        saveButton.do {
//            $0.layer.cornerRadius = 6
//            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
//            $0.layer.borderWidth = 1
//            $0.backgroundColor = UIColor(hex: "#000000")
//            $0.setTitle("저장", for: .normal)
//            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
//            $0.titleLabel?.font = .systemFont(ofSize: 8)
            $0.setImage(Image.Save, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(logoImage, recommendView, listButton, saveButton)
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(640)
            $0.width.equalTo(315)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalTo(recommendView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
    
        saveButton.snp.makeConstraints {
            $0.top.equalTo(recommendView.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(90)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        listButton.addTarget(self, action: #selector(pushToRecommendViewController), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func pushToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
