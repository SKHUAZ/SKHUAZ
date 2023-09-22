//
//  HomeViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/21.
//

import UIKit

import SnapKit
import Then

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let logoImage = UIImageView()
    
    private let profileView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let studentNumberLabel = UILabel()
    private let departmentLabel = UILabel()

    // add more views as per your requirements
    
    
    
   override func viewDidLoad() {
        super.viewDidLoad()

       setUI()
        setLayout()

        // TODO: Add data setup and other methods as needed
   }
}

extension HomeViewController {
    
     // MARK: - UI Setup
    
     func setUI() {

         view.addSubview(scrollView)
         scrollView.addSubview(contentView)

         contentView.addSubviews(logoImage, profileView)
         profileView.addSubviews(profileImageView, nameLabel, studentNumberLabel, departmentLabel)

         logoImage.do {
             $0.contentMode = .scaleAspectFit
             $0.image = Image.Logo1
         }
     }
    
     func setLayout() {

         scrollView.snp.makeConstraints {
             $0.edges.equalTo(view)
         }

         contentView.snp.makeConstraints {
             $0.edges.equalTo(scrollView)
             $0.width.equalTo(scrollView)
             $0.height.greaterThanOrEqualTo(scrollView).priority(.low)
          }

          logoImage.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }
          profileView.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }
          profileImageView.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }
          nameLabel.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }
          studentNumberLabel.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }
          departmentLabel.snp.makeConstraints {
              $0.centerX.equalToSuperview()
          }

      }
}
