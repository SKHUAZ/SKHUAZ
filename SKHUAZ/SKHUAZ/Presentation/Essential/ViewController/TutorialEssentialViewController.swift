//
//  TutorialEssentialViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/27.
//

import UIKit

import SnapKit
import Then

final class TutorialEssentialViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let mainView = UIImageView()
    private let rightButton = UIButton()
    private let leftButton = UIButton()
    private let okButton = UIButton()
    
    
    // MARK: - Properties
    
    private var imageIndex = 0 // 현재 이미지 인덱스
    
    private let images: [UIImage] = [
        Image.javaImage!,
        Image.pythonImage!,
        Image.dataImage!,
        Image.webImage!
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
        
        updateMainView()
    }
}

extension TutorialEssentialViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        mainView.do {
            $0.image = Image.webImage
        }
        
        rightButton.do {
            $0.setImage(Image.rightVector, for: .normal)
        }
        
        leftButton.do {
            $0.setImage(Image.leftVector, for: .normal)
        }
        
        okButton.do {
            $0.setTitle("x 확인완료", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainView, rightButton, leftButton, okButton)
        
        mainView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(472)
            $0.center.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints {
            $0.trailing.equalTo(mainView.snp.leading).offset(-20)
            $0.centerY.equalToSuperview()
            
        }
        
        rightButton.snp.makeConstraints {
            $0.leading.equalTo(mainView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
        
        okButton.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom)
            $0.trailing.equalTo(mainView.snp.trailing)
        }
    }
    
    // MARK: - Methods
    
    
    private func addTarget() {
        okButton.addTarget(self, action: #selector(touchNextButton), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(touchRightButton), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(touchLeftButton), for: .touchUpInside)

    }
    
    private func updateMainView() {
        mainView.image = images[imageIndex]
    }
    
    private func changeToNextImage() {
        imageIndex += 1
        if imageIndex >= images.count {
            imageIndex = 0
        }
        
        updateMainView()
    }
    
    private func changeToPreviousImage() {
        imageIndex -= 1
        if imageIndex < 0 {
            imageIndex = images.count - 1
        }
        
        updateMainView()
    }
    
    @objc private func touchNextButton() {
        dismiss(animated: false, completion: nil)
    }
    
    @objc private func touchRightButton() {
        changeToNextImage()
    }
    
    @objc private func touchLeftButton() {
        changeToPreviousImage()
    }
}
