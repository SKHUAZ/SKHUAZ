//
//  importRootTableViewCell.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/13.
//

import UIKit

import Then
import SnapKit

class importRootTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    private let recommendListContainer = UIView()
    private let mainContainer = UIStackView() //루트추천 본문 컨테이너
    private let topSpace = UIView()
    
    private let recommendContent = UILabel()
    private let courseYear = UILabel()
    private var currentIndex: Int = 0 // 현재 표시 중인 배열의 인덱스
    
    private var preLecture: preLectureData? // 추가된 코드
    private var preLecture2: DetailPreLecture?
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
        selectedBackgroundView = UIView()
        renderLectureContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension importRootTableViewCell {
    
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
        
        courseYear.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.textColor = .white
            $0.numberOfLines = 0 // 여러 줄의 텍스트 지원
        }
//        courseYear.do {
//            $0.font = .systemFont(ofSize: 16, weight: .bold)
//            $0.textColor = .white
//        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
            
            contentView.addSubviews(recommendListContainer)
            recommendListContainer.addSubviews(topSpace, mainContainer)
            
            topSpace.addSubviews(courseYear)
            
            topSpace.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(35)
//                $0.width.equalTo(344)
            }
            
            courseYear.snp.makeConstraints {
                $0.centerX.equalTo(topSpace)
                $0.centerY.equalTo(topSpace)
            }
            
        mainContainer.snp.makeConstraints {
            $0.top.equalTo(topSpace.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(310)
            // 주요 변경: 높이 제약 조건 수정
            $0.height.greaterThanOrEqualTo(38)
        }
    }
    
    //MARK: - configure

    func importRootModelConfigure(with review: PreLectureDTO, at indexPath: IndexPath) {
            let reviewCount = indexPath.row
            self.preLecture = review.data[reviewCount]  // 변경된 코드
            courseYear.text = self.preLecture?.semester  // 변경된 코드
            
            renderLectureContainer()  // 위치 변경됨
        }

    func importRootModelConfigure2(with review: DetailRecommendDTO, at indexPath: IndexPath) {
        let reviewCount = indexPath.row
        self.preLecture2 = review.data.preLectures[reviewCount]
        courseYear.text = self.preLecture2?.semester
        renderLectureContainer()
    }
//    func importRootModelConfigure2(with review: DetailPreLecture, at indexPath: IndexPath, importReviewList: [DetailPreLecture]) {
//        let reviewCount = indexPath.row
//        self.preLecture2 = importReviewList[reviewCount]
//        courseYear.text = self.preLecture2?.semester
//        renderLectureContainer()
//    }
    
    private func renderLectureContainer() {
        mainContainer.subviews.forEach { $0.removeFromSuperview() }
        
        guard let preLecture = self.preLecture else { return }
        
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

         for lectureName in preLecture.lecNames {
             let lectureContainer = CustomRootContainer(lectureName: lectureName)
             lectureContainers.addArrangedSubview(lectureContainer)

             lectureContainer.snp.makeConstraints { make in
                 make.height.equalTo(38)
             }
         }

         mainContainer.addArrangedSubview(lectureContainers)

    }
}
