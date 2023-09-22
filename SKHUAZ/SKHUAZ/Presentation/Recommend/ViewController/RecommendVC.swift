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
    
    private let createButton = UIButton()
    private let writeByMeButton = UIButton()
    private var filteredReviews: [RecommendDataModel]!
    var reviews: [RecommendDataModel]!
    
    
    
    // MARK: - Properties

    private var wroteMeButtonBottomConstraint: Constraint? //글쓰기 버튼 바텀 움직임 제약조건
    private var isMove: Bool = false //글쓰기 버튼 클릭 여부 확인
    private var isTouch: Bool = false
    var reviewList: [RecommendDataModel] = []
    var filteredReviewList: [RecommendDataModel] = []
    var isFiltering = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setUI()
        setLayout()
        setupData()
        setDelegate()
        addTarget()
        setupKeyboardEvent()
        self.hideKeyboardWhenTappedAround()
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
            $0.font = .systemFont(ofSize: 16)
        }
        
//        searchTextField.do {
//            $0.placeholder = "제목 혹은 강의명을 입력해주세요"
//            $0.font = .systemFont(ofSize: 8)
//            $0.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
//            $0.borderStyle = .roundedRect
//            $0.clearButtonMode = .whileEditing
//            $0.returnKeyType = .done
//        }
        searchTextField.do {
            $0.placeholder = "제목 혹은 강의명을 입력해주세요"
            $0.font = .systemFont(ofSize: 8)
            $0.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
            $0.borderStyle = .roundedRect
            $0.clearButtonMode = .whileEditing
            $0.returnKeyType = .done
        }
        
        
        recommendListView.do {
            $0.separatorStyle = .none
            $0.register(RecommendTableViewCell.self, forCellReuseIdentifier: "Cell")
            $0.showsVerticalScrollIndicator = false
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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(47)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
            $0.width.equalTo(168)
        }
        
        recommendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(recommendTitleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(315)
        }
        
        recommendListView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(380)
        }
        
        createButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(104)
            $0.width.height.equalTo(56)
        }
        
        writeByMeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            self.wroteMeButtonBottomConstraint = $0.bottom.equalToSuperview().inset(104).constraint
            $0.width.height.equalTo(56)
        }
    }
    
    // MARK: - Add
    
    private func addTarget() {
        createButton.addTarget(self, action: #selector(movewroteMeButton), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        writeByMeButton.addTarget(self, action: #selector(wroteMeButtonTapped), for:.touchUpInside)
    }
    
    // MARK: - Methods
    
    private func setupData() {
        reviewList = [recommendReview1, recommendReview2, recommendReview3, recommendReview4, recommendReview5, recommendReview6, recommendReview7]
        recommendListView.reloadData()
        reviews = recommendList
        filteredReviews = reviews
    }
    
    private func setDelegate() {
        recommendListView.delegate = self
        recommendListView.dataSource = self
        searchTextField.delegate = self
    }
    
//    private func setUITableView() {
//
//    }
    
    //내가 쓴 글 눌렀을 때 검색창에 본 계정주의 닉네임을 검색하여 내 글이 나오도록 함.
    @objc
    private func wroteMeButtonTapped() {
        isTouch.toggle()
        if isTouch {
            writeByMeButton.setImage(Image.WritingOn, for: .normal)
            searchTextField.text = "박신영"
            searchTextChanged()
        } else {
            writeByMeButton.setImage(Image.WritingOff, for: .normal)
            searchTextField.text = ""
            searchTextChanged()
        }
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
            self.wroteMeButtonBottomConstraint?.update(inset: 104)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        print(isMove)
    }

    @objc
    private func searchTextChanged() {
        
        guard let searchText = searchTextField.text, !searchText.isEmpty else {
            filteredReviews = reviews
            recommendListView.reloadData()
            return
        }
        
        filteredReviews = reviews.filter { review in
            return review.majorNameLabel.contains(searchText) ||
            review.lectureNameLabel.contains(searchText) ||
            review.titleLabel.contains(searchText) ||
            review.authorNameLabel.contains(searchText) ||
            review.professorNameLabel.contains(searchText)
        }
        
        recommendListView.reloadData()
    }
}

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    //RecommendTableView 스크롤 막기
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == recommendListView {
//            scrollView.contentOffset = .zero
//        }
//    }


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
    
    func tableView(_ tableview:UITableView,didSelectRowAt indexPath:IndexPath) {
//        print("You selected cell #\(reviews[indexPath.row].titleLabel)")
        print(reviews)
        let detailVC = DetailRecommendViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
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


extension RecommendViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        recommendListView.isUserInteractionEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        recommendListView.isUserInteractionEnabled = true
    }
}
