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
    var s = UserDefaults.standard.string(forKey: "email")
    var evaluationId = 0
//    var s = UserDefaults.standard.string(forKey: "Nickname") ?? ""
//
//    var nickname = ""
//    var major1 = ""
//    var major2 = ""
    
//     Evaluate
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
        getUserInfo()

        // TODO: Add data setup and other methods as needed
    }
}

extension HomeViewController {
    
    // MARK: - SetupData
    
//    private func setupData() {
//        reviewList = [recommendReview1, recommendReview2, recommendReview3, recommendReview4, recommendReview5, recommendReview6, recommendReview7]
//        rootRecommendReviewIWroteTableView.reloadData()
////        reviews = recommendList
////        filteredReviews = reviews
//    }
    
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
            let nickname = UserDefaults.standard.string(forKey: "Nickname") ?? "기본 닉네임"
            $0.text = "이름  :  \(nickname)"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        studentNumberLabel.do {
            $0.text = ""
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 14)
        }
        
        departmentLabel.do {
            let major1 = UserDefaults.standard.string(forKey: "Major1") ?? "소프트웨어공학과"
            let major2 = UserDefaults.standard.string(forKey: "Major2") ?? "정보통신공학과"
            $0.text = "IT융합자율학부  :  \(major1)  \(major2)"
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
        
//        rootRecommendReviewContainer.do {
//            $0.backgroundColor = .blue
//        }
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
            // height는 contentView에 의해 결정됩니다.
//            $0.height.equalTo(1000)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(900)
            // height는 내부 요소들에 의해 결정됩니다. 따라서 따로 설정하지 않습니다.
        }
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
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
        
        lectureReviewContainer.snp.makeConstraints {
            $0.top.equalTo(bringButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(380)
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
        
        
        rootRecommendReviewContainer.snp.makeConstraints {
            $0.top.equalTo(lectureReviewContainer.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.greaterThanOrEqualTo(contentView)
        }
        
        rootRecommendReviewGuideTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(24)
        }
        
        rootRecommendReviewIWroteTableView.snp.makeConstraints {
            $0.top.equalTo(rootRecommendReviewGuideTitle.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
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
//        self.lectureReviewIWroteTableView.reloadData()
//        self.rootRecommendReviewIWroteTableView.reloadData()
    }
    
    private func addTarget() {
        bringButton.addTarget(self, action: #selector(pushBringButton), for: .touchUpInside)
    }
    
    func getAllEvaluate() {
        EvaluateAPI.shared.getAllEvaluate(token: token) { [self] result in
            switch result {
            case .success(let data):
                if let data = data as? AllevaluateResponseDTO {
                    // 서버에서 받은 데이터를 EvaluateDataModel로 매핑
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
                        mappedData.append(mappedItem)
                    }
                    
                    // 매핑된 데이터를 배열에 저장
                    
                    self.evaluateReviews = mappedData
//                    self.evaluateReviews = []
                    
                    // MARK: - 불러온 내가 쓴 강의평 개수에 따른 내가 쓴 루트추천 레이아웃 분기처리 위한 변수에 값 할당
                    
                    if evaluateReviews.count <= 1 {
                        evaluateReviewCount = 0
                        print("evaluateReviewCount 0으로 변경")
                    } else {
                        evaluateReviewCount = 2
                        print("evaluateReviewCount 0으로 변경")
                    }
                    

                    if self.evaluateReviews.isEmpty {
                        self.handleEvaluateReviews()
                        
                        return
                    }
                    self.evaluatefilteredReviews = self.evaluateReviews
                    
                    
                    // 테이블 뷰 업데이트
                    self.lectureReviewIWroteTableView.reloadData()
                    
                    
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
        print("----------------강의평 불러오기 함수 끝--------------------")
    }
    
    func getAllRootRecommend() {
        RootRecommendAPI.shared.getAllRootRecommend(token: token) { result in
            switch result {
            case .success(let data):
                if let data = data as? AllRootRecommendResponseDTO {
                    // 서버에서 받은 데이터를 EvaluateDataModel로 매핑
                    let serverData = data.data
                    var mappedData: [RootRecommendDataModel] = []
                    
                    for serverItem in serverData {
                        
                        var mappedPreLecturesItems: [PreLectures] = []
                        
                        for prelectureItem in serverItem.preLectures {
                            let newMappedItem = PreLectures(preLectureId: prelectureItem.preLectureId,
                                                            semester: prelectureItem.semester,
                                                            lecNames: prelectureItem.lecNames)
                            
                            mappedPreLecturesItems.append(newMappedItem)
                        }
                        
                        let mappedRootRecommendDataModel  = RootRecommendDataModel(title: serverItem.title,
                                                                                   recommendation : serverItem.recommendation,
                                                                                   createAt :serverItem.createAt ,
                                                                                   email :serverItem.email ,
                                                                                   preLectures:mappedPreLecturesItems, routeId: serverItem.routeId )
                        
                        mappedData.append(mappedRootRecommendDataModel)
                    }
                    
                    // 매핑된 데이터를 배열에 저장
                    self.reviews = mappedData
                    if self.reviews.isEmpty {
                        // 리뷰가 없는 경우 rootRecommendReviewContainer와 관련된 UI 및 레이아웃 변경을 수행합니다.
                        self.handleEmptyRootRecommendReviews()
                        
                        return
                    }
                    self.filteredReviews = self.reviews
                    
                    
                    
                    
                    // 테이블 뷰 업데이트
                    self.lectureReviewIWroteTableView.reloadData()
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
    
    
    func handleEvaluateReviews() {
        print("강의평 불러온거 없다~")
        lectureReviewContainer.removeFromSuperview()
        lectureReviewGuideTitle.removeFromSuperview()
        lectureReviewIWroteTableView.removeFromSuperview()
        
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
        
        
        lectureReviewContainer.snp.makeConstraints {
            $0.top.equalTo(bringButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(600)
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
    
    func handleEmptyRootRecommendReviews() {
        print("루트추천 불러온거 없다~")
        rootRecommendReviewContainer.removeFromSuperview()
        rootRecommendReviewGuideTitle.removeFromSuperview()
        rootRecommendReviewIWroteTableView.removeFromSuperview()
        
        // 새로운 UIView 생성
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
        
        // emptyView에 titleLabel 추가
        emptyView.addSubview(titleLabel)
        
        rootRecommendReviewContainer.addSubviews(rootRecommendReviewGuideTitle, emptyView)
        contentView.addSubview(rootRecommendReviewContainer)
        
        rootRecommendReviewGuideTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(24)
        }
        
        // MARK: - 앞서 분기처리를 위하여 evaluateReviewCount에 할당하였기에, 그에 상응하는 레이아웃 각 처리
        
        // 강의평 개수가 0~1개일 때
        if evaluateReviewCount == 0 {
            print("---------강의평 개수 0~1개 루트추천 레이아웃 발동---------")
            rootRecommendReviewContainer.snp.makeConstraints {
//                $0.top.equalToSuperview().offset(485)
                $0.top.equalTo(lectureReviewContainer.snp.bottom).offset(10)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(contentView)
                $0.height.equalTo(400)
            }
            
            // 강의평 개수가 2개일 때
        } else {
            print("---------강의평 개수 2개 루트추천 레이아웃 발동---------")
            rootRecommendReviewContainer.snp.makeConstraints {
//                $0.top.equalToSuperview().offset(650)// 내가 쓴 강의평 2개일 때 레이아웃
                $0.top.equalTo(lectureReviewContainer.snp.bottom).offset(10)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(contentView)
            }
            
            contentView.snp.makeConstraints {
                $0.edges.equalTo(scrollView)
                $0.width.equalTo(scrollView)
            }
            
        }
        
        
        
        // Auto Layout 설정
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
        
        /**
         강의평 개수에 따라 레이아웃 바꾸는 것 역시 만들어두자.
         0개
         1개
         2개
         바꿔야 하는 것은 contentview 크기와 lecture컨테이너 디자인, rootrecommend컨테이너 top offset 역시 맞춰야함
         */

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
        return 170
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
            let adjustedIndex = (evaluatefilteredReviews?.count ?? 0) - indexPath.row - 1
            if let review = evaluatefilteredReviews?[adjustedIndex] {
                cell.configure(with: review)
            }
            
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
        // If none of the above conditions are met, return a default UITableViewCell.
        return UITableViewCell()
    }
    
    func tableView(_ tableview:UITableView, didSelectRowAt indexPath:IndexPath) {
        if tableview == lectureReviewIWroteTableView {
            let detailVC = DetailEvaluateViewController()
            if let selectedReview = lectureReviews?[indexPath.row] {
                print("현재 selectedReview : \(selectedReview)")
                detailVC.evaluationId = selectedReview.evaluationId
                self.navigationController?.pushViewController(detailVC, animated: true)
            } else {
                // 예외 처리: 선택한 리뷰가 없을 때 실행할 코드
                print("Selected review is nil")
            }
//            detailVC.evaluationId = lectureReviews[indexPath.row].evaluationId
//            self.navigationController?.pushViewController(detailVC, animated: true)
//            print("You selected cell #\(evaluateReviews[indexPath.row].title)")
//            let detailVC = DetailEvaluateViewController()
//            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if tableview == rootRecommendReviewIWroteTableView {
            print("You selected cell #\(reviews[indexPath.row].routeId)")
            let detailVC = DetailRecommendViewController()
            detailVC.recommendID = reviews[indexPath.row].routeId
//                print("You selected cell #\(filteredReviews[indexPath.row].title)")
//                let detailVC = DetailRecommendViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


extension HomeViewController {
    func getUserInfo() {
        HomeAPI.shared.getUserInfo(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "") { result in
            switch result {
            case .success(let data):
                if let data = data as? HomeDTO {
                    let serverData = data.data
                    print("====================================")
                    print(serverData.nickname)
                    print(serverData.major1)
                    print(serverData.major2)
                    UserDefaults.standard.set(serverData.nickname, forKey: "Nickname")
                    UserDefaults.standard.set(serverData.major1, forKey: "Major1")
                    UserDefaults.standard.set(serverData.major2, forKey: "Major2")
                    print("====================================")
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
