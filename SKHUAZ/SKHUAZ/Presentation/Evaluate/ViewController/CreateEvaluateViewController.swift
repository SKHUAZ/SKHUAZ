//
//  CreateEvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/26.
//

import UIKit

import SnapKit
import Then

final class CreateEvaluateViewController: UIViewController {

    // MARK: - UI Components
    
    private let mainLogo = UIImageView()
    private let createEvaluateView = CreateEvaluateView()

    // MARK: - Properties

    // MARK: - Initializer

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)

        setUI()
        setLayout()
    }
}

extension CreateEvaluateViewController {

    // MARK: - UI Components Property

    private func setUI() {
        view.backgroundColor = .white
        
        mainLogo.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo3
        }
    }

    // MARK: - Layout Helper

    private func setLayout() {
        view.addSubviews(mainLogo, createEvaluateView)
        
        mainLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
            $0.width.equalTo(168)
        }
        
        createEvaluateView.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(39)
        }
        
    }

    // MARK: - Methods

    // MARK: - @objc Methods
}
