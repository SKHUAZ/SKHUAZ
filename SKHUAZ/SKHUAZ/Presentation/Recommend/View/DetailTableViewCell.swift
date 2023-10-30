//
//  DetailTableViewCell.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/29/23.
//

import UIKit
import Then
import SnapKit

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    private let recommendListContainer = UIView()
    private let topSpace = UIView()
    private let topSpaceLabel = UILabel()
    private let mainContainer = UIStackView()
    
    // MARK: - Properties
    
    private var currentIndex: Int = 0 // 현재 표시 중인 배열의 인덱스
    private var preLecture: preLectureData?
    private var preLecture2: DetailPreLecture?
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
        renderLectureContainer()
        selectedBackgroundView = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        recommendListContainer.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray.cgColor
        }
        
        topSpace.do {
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.layer.cornerRadius = 6
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        mainContainer.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        
        topSpaceLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .white
            $0.numberOfLines = 0 // 여러 줄의 텍스트 지원
        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
            
        contentView.addSubviews(recommendListContainer)
        recommendListContainer.addSubviews(topSpace, mainContainer)
        topSpace.addSubviews(topSpaceLabel)
        
        recommendListContainer.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        topSpace.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        topSpaceLabel.snp.makeConstraints {
            $0.centerX.equalTo(topSpace)
            $0.centerY.equalTo(topSpace)
        }
            
        mainContainer.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(310)
//            $0.bottom.equalToSuperview()
            $0.height.greaterThanOrEqualTo(38)
        }
    }
    
    //MARK: - configure

    func importRootModelConfigure(with review: PreLectureDTO, at indexPath: IndexPath) {
            let reviewCount = indexPath.row
            self.preLecture = review.data[reviewCount]
            topSpaceLabel.text = self.preLecture?.semester
            renderLectureContainer()
    }

    func importRootModelConfigure2(with review: DetailRecommendDTO, at indexPath: IndexPath) {
        let reviewCount = indexPath.row
        self.preLecture2 = review.data.preLectures[reviewCount]
        topSpaceLabel.text = self.preLecture2?.semester
        renderLectureContainer()
    }
    
    private func renderLectureContainer() {
        
        mainContainer.subviews.forEach { $0.removeFromSuperview() }
        
        guard let preLecture = self.preLecture else { return DetailRenderLectureContainer() }
        
        let lectureContainers = UIStackView()
        lectureContainers.axis = .vertical
        lectureContainers.spacing = 10
        
        let lecCount = preLecture.lecNames.count
        
        recommendListContainer.snp.removeConstraints() // 기존 제약조건 삭제

        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            
            switch lecCount {
                case 1...2:
                    $0.height.equalTo(160)
                case 3:
                    $0.height.equalTo(200)
                case 4:
                    $0.height.equalTo(245)
                case 5:
                    $0.height.equalTo(290)
                case 6:
                    $0.height.equalTo(335)
                case 7:
                    $0.height.equalTo(380)
                default:
                    $0.height.equalTo(425)
            }
         }
//        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\(preLecture.lecNames)🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
         for lectureName in preLecture.lecNames {
//             print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥현재 렉쳐네임 \(lectureName)🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
             let lectureContainer = CustomRootContainer(lectureName: lectureName)
             lectureContainers.addArrangedSubview(lectureContainer)
            
             lectureContainer.snp.makeConstraints { make in
                 make.height.equalTo(38)
//                 make.width.equalTo(100)
             }
         }

         mainContainer.addArrangedSubview(lectureContainers)

    }
    
    func DetailRenderLectureContainer() {
        print("Detail뷰에서 불렀다~")
        guard let preLecture = self.preLecture2 else { return print("preLecture 값은 \(preLecture)") }
        
        let lectureContainers = UIStackView()
        lectureContainers.axis = .vertical
        lectureContainers.spacing = 10
        
        let lecCount = preLecture.lecNames.count
        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\(preLecture.lecNames)🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
        
        recommendListContainer.snp.removeConstraints() // 기존 제약조건 삭제

        recommendListContainer.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            
            switch lecCount {
                case 1...2:
                    $0.height.equalTo(160)
                case 3:
                    $0.height.equalTo(200)
                case 4:
                    $0.height.equalTo(245)
                case 5:
                    $0.height.equalTo(290)
                case 6:
                    $0.height.equalTo(335)
                case 7:
                    $0.height.equalTo(380)
                default:
                    $0.height.equalTo(425)
            }
         }
//        print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\(preLecture.lecNames)🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
         for lectureName in preLecture.lecNames {
//             print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥현재 렉쳐네임 \(lectureName)🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
             let lectureContainer = CustomRootContainer(lectureName: lectureName)
             lectureContainers.addArrangedSubview(lectureContainer)
            
             lectureContainer.snp.makeConstraints { make in
                 make.height.equalTo(38)
//                 make.width.equalTo(100)
             }
         }

         mainContainer.addArrangedSubview(lectureContainers)
    }
}
