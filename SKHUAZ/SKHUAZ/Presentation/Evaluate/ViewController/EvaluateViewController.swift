//
//  EvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import SnapKit
import Then

final class EvaluateViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let evaluateListView = UITableView()
    
    // MARK: - Properties
    
    var reviewList: [EvaluateDataModel] = []
    
    // MARK: - Initializer
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setupData()
        setDelegate()
        setUITableView()
    }
}

extension EvaluateViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        evaluateListView.do {
            $0.separatorStyle = .none
            $0.register(EvaluateTableViewCell.self, forCellReuseIdentifier: "Cell")
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubview(evaluateListView)
        
        evaluateListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [review1, review2, review3, review4, review5]
        evaluateListView.reloadData()
    }
    
    private func setDelegate() {
        evaluateListView.delegate = self // UITableViewDelegate를 설정해주어야 합니다.
   }
    
    private func setUITableView() {
        evaluateListView.dataSource = self
        evaluateListView.tableHeaderView = EvaluateCustomHeaderView()

    }
}

extension EvaluateViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60 // 원하는 헤더 높이로 수정
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return EvaluateCustomHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EvaluateTableViewCell
        let review = reviewList[indexPath.row]
        
        cell.configure(with: review)
        
        return cell
    }
}
