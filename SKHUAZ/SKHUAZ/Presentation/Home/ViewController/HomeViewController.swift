//
//  HomeViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/24.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    //Enter
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let logoImage = UIImageView()
    
    private let profileView = UIView()
    private let profileTextContainer = UIView()
    private let profileButton = UIButton()
    private let nameLabel = UILabel()
    private let studentNumberLabel = UILabel()
    private let departmentLabel = UILabel()
    
    private let bringButton = UIButton()
    
    private let lectureReviewContainer = UIView()
    private let lectureReviewIWroteTableView = UITableView()
    private let lectureReviewGuideTitle = UILabel()
    
    private let rootRecommendReviewContainer = UIView()
    private let rootRecommendReviewIWroteTableView = UITableView()
    private let rootRecommendReviewGuideTitle = UILabel()
    
    var token = UserDefaults.standard.string(forKey: "AuthToken") ?? ""
    var s = UserDefaults.standard.string(forKey: "Nickname")
    var evaluationId = 0
    private var evaluatefilteredReviews: [EvaluateDataModel]!
    var evaluateReviews: [EvaluateDataModel]!
    var evaluateReviewCount = 0
    
    
    
    // Recommend
    private var filteredReviews: [RootRecommendDataModel]!
    var reviews: [RootRecommendDataModel]!
    var lectureReviews: [EvaluateDataModel]!
    
    
    
    // 데이터 불러오기 이전 더미 데이터 사용하기 위함
    var reviewList: [RootRecommendDataModel] = []
    var filteredReviewList: [RootRecommendDataModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserDefaults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        getAllEvaluate()
        getAllRootRecommend()
        setupLayout()
        setRegister()
        setDelegate()
        addTarget()
        setupUI()
    }
    

}

extension HomeViewController {

    
    // MARK: - UI Setup
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        
        logoImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        nameLabel.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        studentNumberLabel.do {
            $0.text = ""
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 14)
        }
        
        departmentLabel.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        bringButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            
            $0.setTitle("나의 선수과목제도 보기", for: .normal)
            
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
        }
        
        lectureReviewGuideTitle.do {
            $0.text = "내가 쓴 강의평"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22)
        }
        
        rootRecommendReviewGuideTitle.do {
            $0.text = "내가 쓴 루트추천"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22)
        }
        
        lectureReviewIWroteTableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
        }
        
        
        rootRecommendReviewIWroteTableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
        }
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.addSubviews(logoImage, contentView)
        profileView.addSubviews(profileTextContainer)
        profileTextContainer.addSubviews(nameLabel, studentNumberLabel, departmentLabel)
        lectureReviewContainer.addSubviews(lectureReviewIWroteTableView, lectureReviewGuideTitle)
        rootRecommendReviewContainer.addSubviews(rootRecommendReviewIWroteTableView, rootRecommendReviewGuideTitle)
        contentView.addSubviews(profileView, bringButton, lectureReviewContainer, rootRecommendReviewContainer)
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.edges.equalTo(view.safeAreaLayoutGuide) // safe area를 고려하여 설정합니다.
            $0.width.equalTo(view.safeAreaLayoutGuide) // width를 화면 너비에 맞게 설정합니다.
        }
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
//            $0.centerX.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        profileTextContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(120)
            $0.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(28)
        }
        
        studentNumberLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        departmentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(studentNumberLabel.snp.bottom).offset(10)
        }
        
        bringButton.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(50)
        }
    }
    
    private func setRegister() {
        lectureReviewIWroteTableView.register(EvaluateTableViewCell.self,
                                              forCellReuseIdentifier:"evaluateCell")
        rootRecommendReviewIWroteTableView.register(RecommendTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func setDelegate() {
        lectureReviewIWroteTableView.delegate = self
        lectureReviewIWroteTableView.dataSource = self
        rootRecommendReviewIWroteTableView.delegate = self
        rootRecommendReviewIWroteTableView.dataSource = self
    }
    
    private func addTarget() {
        bringButton.addTarget(self, action: #selector(pushBringButton), for: .touchUpInside)
    }
    
    
    
    
    func handleEvaluateYes(num: Int) {
        print("강의평 불러온거 있다~ \(num)")
        
        switch num {
            
        case 2:
            lectureReviewContainer.addSubviews(lectureReviewGuideTitle, lectureReviewIWroteTableView)
            contentView.addSubview(lectureReviewContainer)
            
            contentView.snp.makeConstraints { make in
                make.edges.equalTo(scrollView)
                make.width.equalTo(scrollView)
                make.height.equalTo(990)
            }
            
            lectureReviewContainer.snp.makeConstraints {
                $0.top.equalTo(bringButton.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(480)
            }
            
            lectureReviewGuideTitle.snp.makeConstraints {
                $0.top.equalToSuperview().offset(5)
                $0.leading.equalToSuperview().offset(24)
            }
            
            lectureReviewIWroteTableView.snp.makeConstraints {
                //            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.bottom.equalToSuperview()
                $0.top.equalTo(lectureReviewGuideTitle.snp.bottom).offset(10)
            }
            
        default:
            lectureReviewContainer.addSubviews(lectureReviewGuideTitle, lectureReviewIWroteTableView)
            contentView.addSubview(lectureReviewContainer)
            
            contentView.snp.makeConstraints { make in
                make.edges.equalTo(scrollView)
                make.width.equalTo(scrollView)
                make.height.equalTo(760)
            }
            
            lectureReviewContainer.snp.makeConstraints {
                $0.top.equalTo(bringButton.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(250)
            }
            
            lectureReviewGuideTitle.snp.makeConstraints {
                $0.top.equalToSuperview().offset(5)
                $0.leading.equalToSuperview().offset(24)
            }
            
            lectureReviewIWroteTableView.snp.makeConstraints {
                //            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.bottom.equalToSuperview()
                $0.top.equalTo(lectureReviewGuideTitle.snp.bottom).offset(10)
            }
        }
    }
    

    func handleEvaluateReviews() {
        print("강의평 불러온거 없다~")
//        lectureReviewContainer.removeFromSuperview()
//        lectureReviewGuideTitle.removeFromSuperview()
//        lectureReviewIWroteTableView.removeFromSuperview()
        
        // 새로운 UIView 생성
        let emptyView = UIView()
        emptyView.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        }
        
        // "선수과목제도를 추천해보세요"라는 UILabel 생성 및 설정
        let titleLabel = UILabel()
        titleLabel.text = "강의평을 작성해보세요"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14)
        
        // emptyView에 titleLabel 추가
        emptyView.addSubview(titleLabel)
        
        lectureReviewContainer.addSubviews(lectureReviewGuideTitle, emptyView)
        contentView.addSubview(lectureReviewContainer)
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(760)
        }
        
        lectureReviewContainer.snp.makeConstraints {
            $0.top.equalTo(bringButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(220)
        }
        
        lectureReviewGuideTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(24)
        }
        
        // Auto Layout 설정
        emptyView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(lectureReviewGuideTitle.snp.top).offset(30)
            $0.width.equalTo(315)
            $0.height.equalTo(147)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func handleEmptyRootRecommendReviews(num: Int) {
        print("루트추천 불러온거 확인해라~ \(num)")
        
        
        
        switch num {
        case 1...:
            
            rootRecommendReviewContainer.addSubviews(rootRecommendReviewGuideTitle, rootRecommendReviewIWroteTableView)
            contentView.addSubview(rootRecommendReviewContainer)
            
            rootRecommendReviewContainer.snp.makeConstraints {
                $0.top.equalTo(lectureReviewContainer.snp.bottom).offset(10)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(260)
            }
            
            rootRecommendReviewGuideTitle.snp.makeConstraints {
                $0.top.equalToSuperview().offset(5)
                $0.leading.equalToSuperview().offset(24)
            }
            rootRecommendReviewIWroteTableView.snp.makeConstraints {
                $0.top.equalTo(rootRecommendReviewGuideTitle.snp.bottom).offset(15)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            
        default:
            print("🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊지금 루트추천글 0개의 상황🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊")
            // MARK: - SetUI
            
            let emptyView = UIView()
            emptyView.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            }
            
            // "선수과목제도를 추천해보세요"라는 UILabel 생성 및 설정
            let titleLabel = UILabel()
            titleLabel.text = "선수과목제도를 추천해보세요"
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 18)
            
            // MARK: - SetLayout
            
            rootRecommendReviewContainer.addSubviews(rootRecommendReviewGuideTitle, emptyView)
            emptyView.addSubview(titleLabel)
            contentView.addSubview(rootRecommendReviewContainer)
            
            emptyView.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(rootRecommendReviewGuideTitle.snp.bottom).offset(15)
                $0.width.equalTo(315)
                $0.height.equalTo(180)
            }
            
            titleLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
            
            rootRecommendReviewContainer.snp.makeConstraints {
                $0.top.equalTo(lectureReviewContainer.snp.bottom).offset(10)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(220)
            }
            
            rootRecommendReviewGuideTitle.snp.makeConstraints {
                $0.top.equalToSuperview().offset(5)
                $0.leading.equalToSuperview().offset(24)
            }
        }
        
    }
    
    func loadUserDefaults() {
        let major1 = UserDefaults.standard.string(forKey: "Major1") ?? ""
        let major2 = UserDefaults.standard.string(forKey: "Major2") ?? ""
        nameLabel.text = "닉네임 :  \(UserDefaults.standard.string(forKey: "Nickname") ?? "")"
        departmentLabel.text = "IT융합자율학부  :  \(major1)  \(major2)"

    }
    
    
    @objc
    func pushBringButton() {
        let tabBarController = TabBarController()
        tabBarController.selectedIndex = 0 // 첫 번째 탭을 선택합니다. 필요한 경우 이 값을 변경하세요.
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        if tableView == lectureReviewIWroteTableView {
            return min(2, evaluatefilteredReviews?.count ?? 0)
        } else if tableView == rootRecommendReviewIWroteTableView {
            return min(1, filteredReviews?.count ?? 0)
        }
        
        return 0
    }
    
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        if tableView == lectureReviewIWroteTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier:"evaluateCell",for:indexPath) as! EvaluateTableViewCell
            let review = evaluateReviews[indexPath.row]
            cell.configure(with: review)
            
            return cell
            
        } else if tableView == rootRecommendReviewIWroteTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier:"Cell",for:indexPath) as! RecommendTableViewCell
            let adjustedIndex = (filteredReviews?.count ?? 0) - indexPath.row - 1
            if let review = filteredReviews?[adjustedIndex] {
                cell.configureUpdate(with: review, at: indexPath)
            }
            
            return cell
        }
        
        print("tableView 로드실패")
        return UITableViewCell()
    }
    
    func tableView(_ tableview:UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableview == lectureReviewIWroteTableView {
            print("You selected cell #\(evaluateReviews[indexPath.row].evaluationId)")
            let detailVC = DetailEvaluateViewController()
            detailVC.evaluationId = evaluateReviews[indexPath.row].evaluationId
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        else if tableview == rootRecommendReviewIWroteTableView {
            print("You selected cell #\(reviews[indexPath.row].routeId)")
            let detailVC = DetailRecommendViewController()
            detailVC.recommendID = reviews[indexPath.row].routeId
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


extension HomeViewController {
    
    func getAllRootRecommend() {
        RootRecommendAPI.shared.getMyRootRecommend(token: token) { [self] result in
            switch result {
            case .success(let data):
                if let data = data as? MyRecommendsDTO {
                    print("getAllRootRecommend 입장")
                    let serverData = data.data
                    var mappedData: [RootRecommendDataModel] = []
                    for serverItem in serverData {
                        
                        var mappedPreLecturesItems: [PreLectures] = []
                        
                        for prelectureItem in serverItem.preLectures {
                            let newMappedItem = PreLectures(preLectureId: prelectureItem.preLectureID, semester: prelectureItem.semester, lecNames: prelectureItem.lecNames)
                            mappedPreLecturesItems.append(newMappedItem)
                        }

                        let mappedRootRecommendDataModel  = RootRecommendDataModel(title: serverItem.title, recommendation : serverItem.recommendation, createAt :serverItem.createAt, email : "" , preLectures:mappedPreLecturesItems, routeId: serverItem.routeID, nickname: serverItem.nickname)
                        
                        mappedData.append(mappedRootRecommendDataModel)
                    }
                    
                    self.reviews = mappedData
                    self.filteredReviews = self.reviews
                    self.lectureReviewIWroteTableView.reloadData()
                    self.handleEmptyRootRecommendReviews(num: reviews.count)
                } else {
                    print("Failed to decode the response.")
                }
            case .requestErr(let message):
                print("Request error: \(message)")
            case .pathErr:
                print("Path error")
            case .serverErr:
                print("Server error")
            case .networkFail:
                print("Network failure")
            default:
                break
            }
            
        }
    }
    
    func getAllEvaluate() {
        EvaluateAPI.shared.getMyEvaluate(token: token) { [self] result in
            switch result {
            case .success(let data):
                if let data = data as? MyEvaluationsDTO {
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
                            createdAt: serverItem.createdAt, // createdAt 필드 추가
                            nickname: serverItem.nickname
                        )
                        print(mappedItem)
                        
                        mappedData.append(mappedItem)
                    }
                    self.evaluateReviews = mappedData
                    if self.evaluateReviews.isEmpty {
                        self.handleEvaluateReviews()
                        return
                    }
            
                    if evaluateReviews.count <= 1 {
                        evaluateReviewCount = 1
                    } else {
                        evaluateReviewCount = 2
                    }
                    
                    self.evaluatefilteredReviews = self.evaluateReviews
                    self.lectureReviewIWroteTableView.reloadData()
                    handleEvaluateYes(num: evaluateReviewCount)
                } else {
                    print("Failed to decode the response.")
                }
            case .requestErr(let message):
                print("Request error: \(message)")
            case .pathErr:
                print("Path error")
            case .serverErr:
                print("Server error")
            case .networkFail:
                print("Network failure")
            default:
                break
            }
        }
    }
}
