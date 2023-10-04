//
//  EvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import UIKit

import SnapKit
import Then

class EvaluateViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let mainLogo = UIImageView()
    private let titleLabel = UILabel()
    private let searchTextField = UITextField()
    private lazy var tableView = UITableView(frame:.zero, style:.plain)
    private let createButton = UIButton()
    private let wroteMeButton = UIButton()
    
    //MARK: - Properties
    
    private var wroteMeButtonBottomConstraint: Constraint?
    private var isMove: Bool = false
    private var isTouch: Bool = false
    private var filteredReviews: [EvaluateDataModel]!
    var reviews: [EvaluateDataModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllEvaluate()
        setupData()
        setUI()
        setLayout()
        setRegister()
        setDelegate()
        addTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllEvaluate()
    }
}

extension EvaluateViewController {
    
    // MARK: - UI Components Property

    private func setUI() {
        
        view.backgroundColor = .white
        
        mainLogo.do {
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
            $0.clearButtonMode = .whileEditing
            $0.returnKeyType = .done
        }
        
        tableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
        }
        
        createButton.do {
            $0.setImage(Image.createbutton, for: .normal)
        }
        
        wroteMeButton.do {
            $0.setImage(Image.WritingOff, for: .normal)
        }
    }
    
    // MARK: - Layout Helper

    private func setLayout() {
        
        view.addSubviews(mainLogo, titleLabel, searchTextField,
                         tableView, wroteMeButton, createButton)
        
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(47)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
            $0.width.equalTo(168)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(39)
            $0.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
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
    
    // MARK: - Methods

    private func setupData() {
//        reviews = evaluateDataModels
    }
    
    private func setRegister() {
        tableView.register(EvaluateTableViewCell.self,
                           forCellReuseIdentifier:"evaluateCell")
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
    }
    
    private func addTarget() {
        createButton.addTarget(self, action: #selector(movewroteMeButton), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        wroteMeButton.addTarget(self, action: #selector(wroteMeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func wroteMeButtonTapped() {
        isTouch.toggle()
        if isTouch {
            wroteMeButton.setImage(Image.WritingOn, for: .normal)
            searchTextField.text = "천성우"
            searchTextChanged()
        } else {
            wroteMeButton.setImage(Image.WritingOff, for: .normal)
            searchTextField.text = ""
            searchTextChanged()
        }
    }
    
    @objc
    private func movewroteMeButton() {
        isMove.toggle()
        if isMove {
            print("지금은 이동 못 해")
            self.wroteMeButtonBottomConstraint?.update(inset: 168)
            createButton.setImage(Image.edit, for: .normal)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        else if !isMove {
            print("지금은 이동해")
            let vc = CreateEvaluateViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            createButton.setImage(Image.createbutton, for: .normal)
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
            tableView.reloadData()
            return
        }
        
        filteredReviews = reviews.filter { review in
            return review.semester.contains(searchText) ||
            review.professor.contains(searchText) ||
            review.lecture.contains(searchText) ||
            review.title.contains(searchText) ||
            review.department.contains(searchText)
        }
        
        tableView.reloadData()
    }
}

extension EvaluateViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableView.isUserInteractionEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        tableView.isUserInteractionEnabled = true
    }
}

extension EvaluateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return filteredReviews?.count ?? 0
    }


    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier:"evaluateCell",for:indexPath) as! EvaluateTableViewCell
       let review = filteredReviews[indexPath.row]
       cell.configure(with:review)

       return cell
    }
    
    func tableView(_ tableview:UITableView,didSelectRowAt indexPath:IndexPath) {
        print("You selected cell #\(reviews[indexPath.row].evaluationId)")
        let detailVC = DetailEvaluateViewController()
        detailVC.evaluationId = reviews[indexPath.row].evaluationId
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension EvaluateViewController {
    func getAllEvaluate() {
        EvaluateAPI.shared.getAllEvaluate(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "") { result in
            switch result {
            case .success(let data):
                if let data = data as? AllevaluateResponseDTO {
                    let serverData = data.data
                    var mappedData: [EvaluateDataModel] = []
                    
                    for serverItem in serverData {
                        let mappedItem = EvaluateDataModel(
                            semester: serverItem.lecture.semester,
                            professor: serverItem.lecture.profName,
                            lecture: serverItem.lecture.lecName,
                            title: serverItem.title,
                            evaluate: serverItem.review,
                            firstPoint: serverItem.task,
                            secondPoint: serverItem.practice,
                            thirdPoint: serverItem.presentation,
                            fourthPoint: serverItem.teamPlay,
                            department: serverItem.lecture.deptName,
                            authorName: String(serverItem.evaluationID),
                            evaluationId: serverItem.evaluationID, // evaluationId 필드 추가
                            createdAt: serverItem.createdAt // createdAt 필드 추가
                        )
                        mappedData.append(mappedItem)
                    }
                    
                    // 매핑된 데이터를 배열에 저장
                    self.reviews = mappedData
                    self.filteredReviews = self.reviews
                    
                    
                    // 테이블 뷰 업데이트
                    self.tableView.reloadData()
                } else {
                    print("Failed to decode the response.")
                }
            case .requestErr(let message):
                // Handle request error here.
                print("Request error: \(message)")
            case .pathErr:
                // Handle path error here.
                print("Path error")
            case .serverErr:
                // Handle server error here.
                print("Server error")
            case .networkFail:
                // Handle network failure here.
                print("Network failure")
            default:
                break
            }
            
        }
    }
}
