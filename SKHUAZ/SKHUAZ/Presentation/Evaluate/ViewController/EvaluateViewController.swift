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
    
    private let searchTextField = UITextField().then {
        $0.placeholder = "Search by department or lecture name"
        $0.borderStyle = .roundedRect
        $0.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
    }
    
    private let evaluateListView = UITableView()
    
    // MARK: - Properties
    
    var reviewList: [EvaluateDataModel] = []
    var filteredReviewList: [EvaluateDataModel] = []
    var isFiltering = false
    
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
        view.addSubview(searchTextField)
        view.addSubview(evaluateListView)
        
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        evaluateListView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [review1, review2, review3, review4, review5, review6]
        filteredReviewList = reviewList
        evaluateListView.reloadData()
    }
    
    private func setDelegate() {
        evaluateListView.delegate = self
        if let headerView = evaluateListView.tableHeaderView as? EvaluateCustomHeaderView {
            headerView.delegate = self
        }
    }
    
    private func setUITableView() {
        evaluateListView.dataSource = self
    }
    
    
    @objc func searchTextChanged() {
        if let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty {
            filteredReviewList = reviewList.filter { ($0.department.lowercased().contains(searchText) || $0.lectureNameLabel.lowercased().contains(searchText)) }
            isFiltering = true
        } else {
            filteredReviewList = reviewList
            isFiltering = false
        }
        evaluateListView.reloadData()
    }}

extension EvaluateViewController: EvaluateCustomHeaderViewDelegate {
    func optionButtonTapped(title: String) {
        searchTextField.text = title
        searchTextChanged()
    }
}

extension EvaluateViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = EvaluateCustomHeaderView()
        headerView.delegate = self
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredReviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EvaluateTableViewCell
        let review = filteredReviewList[indexPath.row]
        
        cell.configure(with: review)
        
        return cell
    }
}
