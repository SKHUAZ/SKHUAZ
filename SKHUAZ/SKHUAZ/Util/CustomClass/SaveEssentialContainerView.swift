//
//  SaveEssentialContainerView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import UIKit

import Then
import SnapKit

final class SaveEssentialContainerView: UIView {
    private let container = UIView()
    private let containerTopSpace = UIView()
    private let containerTitle = UILabel()
    private var subContainerViews: [SaveEssentialSubContainerView] = []

    init(lectureData: [saveEssentialDataModel]) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
        
        configureSubContainers(with: lectureData)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        container.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        containerTopSpace.do {
            $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
        }
        
        containerTitle.do {
            $0.text = "선택한 강의"
            $0.textColor = UIColor(hex: "#FFFFFF")
            $0.font = .systemFont(ofSize: 11)
        }
    }

    private func setupLayout() {
        addSubviews(container)
        container.addSubviews(containerTopSpace)
        containerTopSpace.addSubviews(containerTitle)

        

        
        containerTopSpace.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        containerTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(30)
        }
        
//        subContainerViews.snp.makeConstraints {
//            $0.top.equalTo(containerTopSpace.snp.bottom).offset(5)
//            $0.leading.equalToSuperview().offset(7)
//            $0.height.equalTo(35)
//            $0.width.equalTo(335)
//        }
        
        
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureSubContainers(with lectureData: [saveEssentialDataModel]) {
        for data in lectureData {
            let subContainerView = SaveEssentialSubContainerView(
                lectureName: data.lectureName,
                professorName: data.professorName
            )
            subContainerViews.append(subContainerView)
            
            addSubview(subContainerView)
        }
        
        for (index, subContainer) in subContainerViews.enumerated() {
            if index == 0 { // 첫 번째 서브 컨테이너
                subContainer.snp.makeConstraints { make in
                    make.top.equalTo(containerTopSpace.snp.bottom).offset(5)
                    make.leading.equalToSuperview().offset(7)
                    make.height.equalTo(35)
                    make.width.equalTo(335)
                }
            } else { // 이전 서브 컨테이너를 기준으로 위치 지정
                let previousSubcontainer = subContainerViews[index - 1]
                
                subContainer.snp.makeConstraints { make in
                    make.top.equalTo(previousSubcontainer.snp.bottom).offset(5)
                    make.leading.trailing.equalTo(previousSubcontainer)
                    make.height.width.equalTo(previousSubcontainer)
                }
            }
            
            if index == lectureData.count - 1 { // 마지막 서브 컨테이너인 경우
                container.snp.makeConstraints { $0.bottom.equalTo(subContainer) }
            }
        }
    }
}
