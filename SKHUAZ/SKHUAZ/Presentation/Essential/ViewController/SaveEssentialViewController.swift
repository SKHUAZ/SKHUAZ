//
//  SaveEssentialViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import UIKit

import Alamofire
import SnapKit
import Then

final class SaveEssentialViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let containerView = SaveEssentialContainerView(
         lectureData: saveEssentialDataModels
     )
    
//    private let backButton = UIButton()
    
    // MARK: - Properties
    
    private var lectureData: [saveEssentialDataModel] = saveEssentialDataModels
    

        
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        openSaveAlert()
        setNavigationBar()
    }
}

extension SaveEssentialViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        titleLabel.do {
            $0.text = "선수과목제도 확인"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        subTitleLabel.do {
            $0.text = "선수과목제도 설정이 완료되었습니다"
            $0.font = .systemFont(ofSize: 11)
            $0.textColor = UIColor(hex: "#000000")
        }
        
        scrollView.do {
            $0.alwaysBounceVertical = true
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() // 가로 스크롤을 위해 contentView의 너비를 스크롤 뷰와 동일하게 설정
            $0.height.equalTo(view.snp.height) // contentView의 높이는 view의 높이보다 크거나 같도록 설정하여 세로 스크롤 가능하도
        }
        contentView.addSubviews(titleLabel, subTitleLabel, containerView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(41)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27 + saveEssentialDataModels.count * 40)
            $0.width.equalTo(354)
        }
    }
    
    // MARK: - Methods
    
    private func setNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#9AC1D1")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9AC1D1")]
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func openSaveAlert() {
        let customAlertVC = AlertViewController(alertType: .save)
            customAlertVC.modalPresentationStyle = .overFullScreen
            UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
    }
    
    
}
