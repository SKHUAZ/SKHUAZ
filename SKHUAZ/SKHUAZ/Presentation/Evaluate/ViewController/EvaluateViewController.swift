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
    
    private let tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(EvaluateTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
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
    }
}

extension EvaluateViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [review1, review2, review3, review4, review5]
        tableView.reloadData()
    }
}

extension EvaluateViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
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
