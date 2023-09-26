//
//  EssentialViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/12.
//

import UIKit

import SnapKit
import Then

final class EssentialViewController: UIViewController, EssentialBottomSheetDelegate {
    
    // MARK: - UI Components
    
    private let essentialView = EssentialView(frame: .zero, essentialType: .user)
    private let sideMenu = EssentialSideView()
    
    // MARK: - Properties
    
    private var isMenuOpen = false
    
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setSwipe()
        setAddTarget()
        
    }
}

extension EssentialViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        sideMenu.do {
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(essentialView, sideMenu)
        
        essentialView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        essentialView.listButtonHandler = { [weak self] in
            self?.openSideMenu()
        }
        
//        essentialView.saveButtonHandler = { [weak self] in
//            let bottomSheetVC = EssentialBottomSheetViewController()
//            self?.present(bottomSheetVC, animated: true)
//        }
        
        essentialView.saveButtonHandler = { [weak self] in
             let bottomSheetVC = EssentialBottomSheetViewController()
             bottomSheetVC.delegates = self // 델리게이트 설정
             self?.present(bottomSheetVC, animated: true)
         }
        
        essentialView.adminButtonHandler = { [weak self] in
            let customAlertVC = AlertViewController(alertType: .admin)
            customAlertVC.modalPresentationStyle = .overFullScreen
            UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
        }
    }
    
    func didTapSaveButtons() {
        dismiss(animated: true) { [weak self] in
            let saveEssentialVC = SaveEssentialViewController()
            self?.navigationController?.pushViewController(saveEssentialVC, animated: false)
        }
    }
    
    private func setSwipe() {
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(openSideMenu))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action:#selector(openSideMenu))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
    }
    
    private func setupSideMenuLayout() {
        view.addSubviews(sideMenu)
        
        sideMenu.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(145)
            $0.width.equalTo(145)
        }
    }
    
    @objc func openSideMenu() {
        if !isMenuOpen {
            view.addSubviews(sideMenu)
            sideMenu.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0, options: .curveEaseInOut) { [weak self] in
                guard let self = self else { return }
                self.sideMenu.snp.makeConstraints {
                    $0.top.leading.bottom.equalToSuperview()
                    $0.width.equalTo(145)
                }
                self.essentialView.snp.remakeConstraints { (make) in
                    make.edges.equalToSuperview().inset(UIEdgeInsets(top:0, left:145, bottom :0 , right :0))
                }

                self.view.layoutIfNeeded()
                self.isMenuOpen.toggle()
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0, options: .curveEaseInOut) { [weak self] in
                guard let self = self else { return }
                self.essentialView.snp.remakeConstraints{ (make) in
                    make.edges.equalToSuperview().inset(UIEdgeInsets(top :0 , left :0 , bottom :0 , right :0))
                }
                self.sideMenu.removeFromSuperview()
                self.view.layoutIfNeeded()
                isMenuOpen.toggle()
            }
        }
    }
}


