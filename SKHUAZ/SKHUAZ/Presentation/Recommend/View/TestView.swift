//
//  TestView.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/12.
//

import UIKit
import SnapKit

class TestView: UIView {
    private let pageButtonsContainer = UIView()
    let reviewsPerPage = 3 // 한 페이지당 표시될 리뷰 수
    private var currentPage = 1 // 현재 페이지 번호
    private var totalNumberOfPages = 0 // 전체 페이지 수
    private var pageButtons: [UIButton] = []

    var reviewList: [RecommendDataModel] = [] {
        willSet {
            totalNumberOfPages = Int(ceil(Double(reviewList.count) / Double(reviewsPerPage)))
            setupPageButtons()
            updatePageButtons()
        }
    }

    var onPaginationChange: ((Int) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        backgroundColor = .white
    }

    private func setLayout() {

        var previousButton: UIButton?
        for subview in pageButtonsContainer.subviews {
            subview.snp.makeConstraints {
                if let previousButton = previousButton {
                    $0.leading.equalTo(previousButton.snp.trailing).offset(10) // 버튼 간 간격 설정
                } else {
                    $0.leading.equalToSuperview()
                }
                $0.centerY.equalToSuperview()
            }
            previousButton = subview as? UIButton
        }
    }

    @objc private func pageButtonTapped(_ sender: UIButton) {
        currentPage = sender.tag
        onPaginationChange?(currentPage)
        updatePageButtons()
    }

    private func updatePageButtons() {
        for (index, button) in pageButtons.enumerated() {
            if index + 1 == currentPage {
                button.setTitleColor(.blue, for: .normal)
            } else {
                button.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    private func setupPageButtons() {
        // 기존 페이지 버튼 제거
        for button in pageButtons {
            button.removeFromSuperview()
        }
        pageButtons.removeAll()

        // 새로운 페이지 버튼 생성
        for i in 1...5 {
            let pageButton = UIButton()
            pageButton.setTitle("\(i)", for: .normal)
            pageButton.tag = i
            pageButton.setTitleColor(.black, for: .normal)
            pageButton.addTarget(self, action: #selector(pageButtonTapped(_:)), for: .touchUpInside)
            pageButtonsContainer.addSubview(pageButton)
            pageButtons.append(pageButton)
        }
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
