//
//  RecommendViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/08/26.
//

import UIKit
import SnapKit
import Then


final class RecommendViewController: UIViewController {
    
    // MARK: - UI Components
    private let logoImage = UIImageView()
    private let recommendTitleLabel = UILabel()
    private let searchTextField = UITextField()
    private let recommendListView = UITableView()
    private let pageNationView = RecommendCustomPagenationView()
    
    private let createButton = UIButton()
    private let writeByMeButton = UIButton()
    
//    private let testView = TestView()

    
    // MARK: - Properties

    private var wroteMeButtonBottomConstraint: Constraint? //글쓰기 버튼 바텀 움직임 제약조건
    private var isMove: Bool = false //글쓰기 버튼 클릭 여부 확인 위함
    var reviewList: [RecommendDataModel] = []
    var filteredReviewList: [RecommendDataModel] = []
    var isFiltering = false
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setUI()
        setLayout()
        setupData()
        setDelegate()
        setUITableView()
        addTarget()
        setupKeyboardEvent()
//        setTapScreen()
    }
        
}

//RecommendViewController 의 확장기능들
extension RecommendViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        logoImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        recommendTitleLabel.do {
            $0.text = "루트추천"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 20)
        }
        
        searchTextField.do {
            $0.placeholder = "제목 혹은 강의명을 입력해주세요"
            $0.font = .systemFont(ofSize: 12)
            $0.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
            
            $0.borderStyle = .roundedRect
            $0.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        }
        recommendListView.do {
            $0.separatorStyle = .none
            $0.register(RecommendTableViewCell.self, forCellReuseIdentifier: "Cell")
//            $0.isScrollEnabled = true
        }
        
        
        createButton.do {
            $0.setImage(Image.createbutton, for: .normal)
        }
        
        writeByMeButton.do {
            $0.setImage(Image.WritingOff, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(logoImage, recommendTitleLabel,searchTextField,
                         recommendListView, writeByMeButton, createButton)
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        recommendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(recommendTitleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(335)
        }
        
        recommendListView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(380)
        }
        
        createButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(90)
            $0.width.height.equalTo(56)
        }
        
        writeByMeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            self.wroteMeButtonBottomConstraint = $0.bottom.equalToSuperview().inset(90).constraint
            $0.width.height.equalTo(56)
        }
    }
    
    // MARK: - Add
    
    private func addTarget() {
        createButton.addTarget(self, action: #selector(movewroteMeButton), for: .touchUpInside)
                writeByMeButton.addTarget(self, action: #selector(wroteMeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [recommendReview1, recommendReview2, recommendReview3]
        recommendListView.reloadData()
    }
    
    private func setDelegate() {
        recommendListView.delegate = self
    }
    
    private func setUITableView() {
        recommendListView.dataSource = self
    }
    
    //내가 쓴 글 눌렀을 때 검색창에 본 계정주의 닉네임을 검색하여 내 글이 나오도록 함.
    @objc
    private func wroteMeButtonTapped() {
        searchTextField.text = "박신영"
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
            let vc = CreateRecommendViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.wroteMeButtonBottomConstraint?.update(inset: 90)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        print(isMove)
    }

    @objc func searchTextChanged() {
        if let searchText = searchTextField.text?.lowercased(), !searchText.isEmpty {
            filteredReviewList = reviewList.filter { ($0.nickNameLabel.lowercased().contains(searchText) || $0.titleLabel.lowercased().contains(searchText))
            }
            isFiltering = true
        } else {
            filteredReviewList = reviewList
            isFiltering = false
        }
        recommendListView.reloadData()
    }
}

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    //RecommendTableView 스크롤 막기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == recommendListView {
            scrollView.contentOffset = .zero
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecommendTableViewCell
        let review = reviewList[indexPath.row]
        
        cell.configure(with: review)
        
        return cell
    }
    
    private func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

    }
    
    // MARK: - @objc Methods
    
    @objc
    private func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentResponder as? UITextField else { return }
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let keyboardOverlap = textFieldBottomY - keyboardTopY
            view.frame.origin.y = -keyboardOverlap - 40
        }
    }
    
    @objc
    private func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    @objc
    private func pushToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
