//
//  DetailRecommendViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/18.
//

import UIKit
import SnapKit
import Then

class DetailRecommendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let recommendView = CreateRecommendView(frame: .zero, recommendType: .detailsRecommend)
    private let mainImage = UIImageView()
    //    private let recommendDetailView = DetailRecommendView()
    private let backButton = UIButton()
    private let saveButton = UIButton()
    private let importRecommendListView = UITableView()
    private let editButton = UIButton()
    private let deleteButton = UIButton()
    private let modifyButton = UIButton()
    
    private let scrollContainer = UIScrollView()
    
    // MARK: - Properties
    
    var recommendID: Int = 0
    var loginEmail = UserDefaults.standard.string(forKey: "LoginEmail")
    private var writerEmail: String = ""
    var importReviewList: [DetailRecommendDTO] = []
    private var putData = EditRootRecommendRequestBody()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        self.hideKeyboardWhenTappedAround()
        addTarget()
        setupData()
        setDelegate()
        setUITableView()
        loadDetailRoot()
        setNavigationBar()
    }
}

extension DetailRecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        importRecommendListView.do {
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.separatorStyle = .none
            $0.register(DetailTableViewCell.self, forCellReuseIdentifier: "Cell")
            $0.showsVerticalScrollIndicator = false
        }
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        backButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("목록", for: .normal)
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#000000")
            $0.setTitle("삭제", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 8)
        }
        
        editButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("수정", for: .normal)
            $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        
        deleteButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.setTitle("삭제", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        
        modifyButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("수정", for: .normal)
            $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.isHidden = true
        }
        
        scrollContainer.do {
            $0.isHidden = false
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(recommendView, editButton, deleteButton, modifyButton, importRecommendListView)
        
        //        scrollContainer.addSubview(importRecommendListView)
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(310)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        importRecommendListView.snp.makeConstraints {
            $0.top.equalTo(recommendView.snp.bottom).offset(10)
            $0.width.equalTo(350)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(editButton.snp.top).offset(-15)
        }
        
        editButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        //
        deleteButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(deleteButton.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(39)
        }
    }
    
    private func setNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#9AC1D1")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9AC1D1")]
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        editButton.addTarget(self, action: #selector(editRootRecommend), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(delRootRecommend), for: .touchUpInside)
        modifyButton.addTarget(self, action: #selector(modifyRootRecommend), for: .touchUpInside)
    }
    
    private func deleteButtonisEnabled() {
        deleteButton.isEnabled = false
    }
    
    private func deleteButtonUnEnabled() {
        deleteButton.isEnabled = true
        editButton.isHidden = false
        deleteButton.isHidden = false
        modifyButton.isHidden = true
    }
    
    private func setupData() {
        importRecommendListView.reloadData()
    }
    
    private func setDelegate() {
        importRecommendListView.delegate = self
    }
    
    private func setUITableView() {
        importRecommendListView.dataSource = self
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func modifyRootRecommend() {
        editRootRecommendDataBind()
        putRootRecommend(putRootRecommendRequestBody: putData)
    }
    
    @objc
    private func deleteReview() {
        deleteRootRecommend(recommendID: recommendID)
        dismiss(animated: false, completion: nil)
    }
    
    @objc
    private func editRootRecommend() {
        
        if loginEmail == writerEmail || UserDefaults.standard.string(forKey: "Nickname") == "admin" {
            print("작성자가와 로그인 한 사람이 같습니다")
            recommendView.setEditable(true)
            deleteButtonisEnabled()
            editButton.isHidden = true
            deleteButton.isHidden = true
            modifyButton.isHidden = false
        } else {
            print("작성자와 로그인 한 사람이 다릅니다")
            let customAlertVC = AlertViewController(alertType: .unWriter)
            customAlertVC.modalPresentationStyle = .overFullScreen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let mainWindow = windowScene.windows.first {
                mainWindow.rootViewController?.present(customAlertVC, animated: false, completion: nil)
            }
        }
    }
    
    @objc
    private func delRootRecommend() {
        if loginEmail == writerEmail || UserDefaults.standard.string(forKey: "Nickname") == "admin" {
            print("작성자와 로그인 한 사람이 같습니다.")
            let customAlertVC = AlertViewController(alertType: .writer)
            customAlertVC.setCheckButtonAction(target: self, action: #selector(deleteReview))
            
            customAlertVC.modalPresentationStyle = .overFullScreen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let mainWindow = windowScene.windows.first {
                mainWindow.rootViewController?.present(customAlertVC, animated: false, completion: nil)
            }
        } else {
            print("작성자와 로그인 한 사람이 일치하지 않습니다")
            let customAlertVC = AlertViewController(alertType: .unWriter)
            customAlertVC.modalPresentationStyle = .overFullScreen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let mainWindow = windowScene.windows.first {
                mainWindow.rootViewController?.present(customAlertVC, animated: false, completion: nil)
            }
        }
    }
    
    @objc
    private func popToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard !importReviewList.isEmpty else { return 0 }
        let dto = importReviewList[0]
        
        let review = dto.data.preLectures[indexPath.row]
        let lecCount = review.lecNames.count
        
        switch lecCount {
        case 1...2:
            return 170
        case 3:
            return 210
        case 4:
            return 255
        case 5:
            return 300
        case 6:
            return 345
        case 7:
            return 390
        default:
            return 435
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !importReviewList.isEmpty else {
            return 0 // importReviewList가 비어있으면 0을 반환합니다.
        }
        let dto = importReviewList[0]
        let t = dto.data.preLectures
        
        return t.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        guard !importReviewList.isEmpty else { return cell }
        let dto = importReviewList[0]// 이 부분을 수정하세요.
        cell.importRootModelConfigure2(with: dto, at: indexPath)
        
        return cell
    }
}

extension DetailRecommendViewController {
    
    private func loadDetailRoot() {
        
        RootRecommendAPI.shared.getDetailRootRecommend(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", rootrecommendID: recommendID) { result in
            switch result {
            case .success(let detailrootDTO):
                if let detailrootDTO = detailrootDTO as? DetailRecommendDTO {
                    //                         print(detailrootDTO.data)
                    self.writerEmail = detailrootDTO.data.preLectures.first?.email ?? ""
                    print(self.writerEmail)
                    print(self.writerEmail)

                    print(self.writerEmail)

                    print(self.writerEmail)

                    print(self.writerEmail)

                    
                    self.importReviewList = [detailrootDTO]

                    print("🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊현재 importReviewList\(self.importReviewList)🌊🌊🌊🌊🌊🌊🌊🌊🌊")
                    DispatchQueue.main.async {
                        self.importRecommendListView.reloadData()
                        //                                 self.scrollContainer.addSubview(self.importRecommendListView)
                        self.recommendView.setDetailRecommendView(title: detailrootDTO.data.title, content: detailrootDTO.data.recommendation)
                    }
                    
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
    
    private func deleteRootRecommend(recommendID: Int) {
        RootRecommendAPI.shared.delRootRecommend(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", recommendId: recommendID) { result in
            switch result {
            case .success(let data):
                if let response = data as? DelRecommendDTO {
                    print("Deleted successfully with message: \(response.message)")
                    DispatchQueue.main.async { [weak self] in
                        self?.navigationController?.popViewController(animated: true)
                    }
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
    
    private func putRootRecommend(putRootRecommendRequestBody: EditRootRecommendRequestBody) {
        self.deleteButtonUnEnabled()
        
        RootRecommendAPI.shared.editRootRecommend(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", recommendId: recommendID, requestBody: putRootRecommendRequestBody) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
                self.deleteButtonUnEnabled()
                
                if let response = data as? EditRootRecommendDTO {
                    print("EditRoot successfully with message: \(response.message)")
                    print("====================================================================")
                    DispatchQueue.main.async { [weak self] in
                        self?.navigationController?.popViewController(animated: true)
                    }
                    self.deleteButtonUnEnabled()
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
    
    private func editRootRecommendDataBind() {
        self.putData.title = recommendView.titleTextFieldText ?? ""
        self.putData.recommendation = recommendView.contentTextFieldText ?? "''"
    }
}
