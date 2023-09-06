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
    
    private let mainImage = UIImageView()
    private let titleLabel = UILabel()
    private let searchTextField = UITextField()
    private let evaluateListView = UITableView()
    private let createButton = UIButton()
    private let wroteMeButton = UIButton()
    
    // MARK: - Properties
    
    private var wroteMeButtonBottomConstraint: Constraint?
    private var isMove: Bool = false
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
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setUI()
        setLayout()
        setupData()
        setDelegate()
        setTapScreen()
        addTarget()
        setUITableView()
    }
}

extension EvaluateViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        titleLabel.do {
            $0.text = "강의평"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        searchTextField.do {
            $0.placeholder = "검색어를 입력해주세요"
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
            
            $0.borderStyle = .roundedRect
            $0.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        }
        
        evaluateListView.do {
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.register(EvaluateTableViewCell.self, forCellReuseIdentifier: "Cell")
        }
        
        createButton.do {
            $0.setImage(Image.CreateButton, for: .normal)
        }
        
        wroteMeButton.do {
            $0.setImage(Image.WritingOff, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(mainImage, titleLabel,searchTextField,
                         evaluateListView, wroteMeButton, createButton)
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
            $0.width.equalTo(168)
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(30)
        }
        
        evaluateListView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
        
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        createButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(104)
            $0.width.height.equalTo(56)
        }
        
        wroteMeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            self.wroteMeButtonBottomConstraint = $0.bottom.equalToSuperview().inset(104).constraint
            $0.width.height.equalTo(56)
        }
    }
    
    // MARK: - Add
    
    private func addTarget() {

        createButton.addTarget(self, action: #selector(movewroteMeButton), for: .touchUpInside)
        wroteMeButton.addTarget(self, action: #selector(wroteMeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [review1, review2, review3, review4, review5, review6]
        filteredReviewList = reviewList
        evaluateListView.reloadData()
    }
    
    private func setDelegate() {
        evaluateListView.delegate = self
    }
    
    private func setUITableView() {
        evaluateListView.dataSource = self
    }
    
    @objc
    private func wroteMeButtonTapped() {
        searchTextField.text = "천성우"
        searchTextChanged()
    }
    
    @objc
    private func movewroteMeButton() {
        isMove.toggle()
        if isMove {
            self.wroteMeButtonBottomConstraint?.update(inset: 168)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        else if !isMove {
            let vc = CreateEvaluateViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.wroteMeButtonBottomConstraint?.update(inset: 104)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        print(isMove)
        
    }
    
    @objc
    func searchTextChanged() {
        if let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty {
            filteredReviewList = reviewList.filter { ($0.department.lowercased().contains(searchText) || $0.lectureNameLabel.lowercased().contains(searchText) || $0.title.lowercased().contains(searchText) || $0.authorNameLabel.lowercased().contains(searchText) || $0.professorNameLabel.lowercased().contains(searchText)) }
            isFiltering = true
        } else {
            filteredReviewList = reviewList
            isFiltering = false
        }
        evaluateListView.reloadData()
    }
}

extension EvaluateViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
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
