//
//  DetailRecommendViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/18.
//

import UIKit

import SnapKit
import Then

class DetailRecommendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let recommendView = CreateRecommendView(frame: .zero, recommendType: .datailsRecommend)
    private let mainImage = UIImageView()
//    private let recommendDetailView = DetailRecommendView()
    private let backButton = UIButton()
    private let saveButton = UIButton()
    private let importRecommendListView = UITableView()
    
    // MARK: - Properties
    
    var importReviewList: [RecommendDataModel] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
//        self.hideKeyboardWhenTappedAround()
        addTarget()
        recommendView.setDetailRecommendView(title: "제목이지롱", content: "본문이지롱")
        setupData()
        setDelegate()
        setUITableView()
    }
}

extension DetailRecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return importReviewList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! importRootTableViewCell
        let review = importReviewList[indexPath.row]
        print(review)
        
        cell.importRootModelConfigure(with: review)
        
        return cell
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        importRecommendListView.do {
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.separatorStyle = .none
            $0.register(importRootTableViewCell.self, forCellReuseIdentifier: "Cell")
            $0.showsVerticalScrollIndicator = false
        }
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        backButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("목록", for: .normal)
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#000000")
            $0.setTitle("삭제", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainImage, recommendView, backButton, saveButton, importRecommendListView)
        
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(19)
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(640)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
    
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        importRecommendListView.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(310)
            $0.bottom.equalTo(saveButton.snp.top).inset(-15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(popToRecommendViewController), for: .touchUpInside)
    }
    
    private func setupData() {
        importReviewList = [recommendReview1, recommendReview2, recommendReview3, recommendReview4]
        importRecommendListView.reloadData()
    }
    
    private func setDelegate() {
        importRecommendListView.delegate = self
    }
    
    private func setUITableView() {
        importRecommendListView.dataSource = self
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func popToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
