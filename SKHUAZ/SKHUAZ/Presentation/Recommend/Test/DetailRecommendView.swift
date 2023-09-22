////
////  DetailRecommendView.swift
////  SKHUAZ
////
////  Created by 박신영 on 2023/09/18.
////
//
//import UIKit
//import Then
//import SnapKit
//
//class DetailRecommendView: UIView {
//    
//    // MARK: - Properties
//    
//    
//    // MARK: - UI Components
//    
//    let titleTextField = UITextField()
//    let recommendContentView = UITextView()
//    
//    let attributes: [NSAttributedString.Key: Any] = [
//        .foregroundColor: UIColor(hex: "#737373"),
//    ]
//    var importReviewList: [ImportRootModel] = []
//    private let importRecommendListView = UITableView()
//    
//    
//    // MARK: - Initializer
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUI()
//        setLayout()
//        setDelegate()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension DetailRecommendView: UITableViewDataSource, UITableViewDelegate {
//    
//    // MARK: - UI Components Property
//    
//    
//    private func setUI(){
//    
//        titleTextField.do {
//            $0.font = .systemFont(ofSize: 15)
//            $0.textColor = .black
//            $0.backgroundColor = UIColor(hex: "#EFEFEF")
//            $0.layer.cornerRadius = 6
//            $0.isEnabled = false
//            let paddingView = UIView(frame:CGRect(x:0, y:0, width:13, height:$0.frame.height))
//            $0.leftViewMode = .always
//            $0.leftView = paddingView
//            $0.returnKeyType = .done
//        }
//        
//        recommendContentView.do {
//            $0.font = .systemFont(ofSize: 15)
//            $0.textColor = UIColor(hex: "#000000")
//            $0.backgroundColor = UIColor(hex: "#EFEFEF")
//            $0.textContainerInset = UIEdgeInsets(top: 9, left: 8, bottom: 0, right: 0)
//            $0.layer.cornerRadius = 6
//            $0.isEditable = false
//        }
//        
//        
//        
//    }
//    
//    
//    // MARK: - Layout Helper
//    
//    private func setLayout() {
//        addSubviews(titleTextField, recommendContentView, importRecommendListView)
//        
//        titleTextField.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(50)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(345)
//            $0.height.equalTo(40)
//        }
//        
//        recommendContentView.snp.makeConstraints {
//            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(345)
//            $0.height.equalTo(220)
//        }
//        
//        
//        importRecommendListView.snp.makeConstraints {
//            $0.top.equalTo(recommendContentView.snp.bottom).offset(10)
//            $0.bottom.equalToSuperview()
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(UIScreen.main.bounds.width)
//        }
//        
//        
//    }
//    
//    // MARK: - Methods
//    
//    private func setupData() {
//        importReviewList = [ImportRootReview1, ImportRootReview2, ImportRootReview3, ImportRootReview4]
//        importRecommendListView.reloadData()
//    }
//    
//    private func setDelegate() {
//        importRecommendListView.delegate = self
//    }
//    
//    private func setUITableView() {
//        importRecommendListView.dataSource = self
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return importReviewList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! importRootTableViewCell
//        let review = importReviewList[indexPath.row]
//        print(review)
//        
//        cell.importRootModelConfigure(with: review)
//        
//        return cell
//    }
//}
//
