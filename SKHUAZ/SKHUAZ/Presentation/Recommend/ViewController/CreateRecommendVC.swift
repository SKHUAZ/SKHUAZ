//
//  CreateRecommendViewController.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/07.
//

import UIKit
import SnapKit
import Then

final class CreateRecommendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let recommendView = CreateRecommendView(frame: .zero, recommendType: .createRecommend)
    private let logoImage = UIImageView()
    private let backButton = UIButton()
    private let saveButton = UIButton()
    private let bringButton = UIButton()
    
    private let importRecommendListView = UITableView()
    
    private let bringRootRecommend = UIImageView()
    private let scrollContainer = UIScrollView()
    var getpreLectureId = [Int]()
    var createData = CreateRecommendRequestBody()
    
    
    var pushBringButtonFlag: Bool = false
    var token = UserDefaults.standard.string(forKey: "AuthToken") ?? ""
    
    // MARK: - Properties
    
    var importReviewList: [PreLectureDTO] = []
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
        setupKeyboardEvent()
        setupData()
        setDelegate()
        setUITableView()
        self.hideKeyboardWhenTappedAround()
        
        // 임시방편으로 넣어둠
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#9AC1D1")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9AC1D1")]
    }
}

extension CreateRecommendViewController: CreateEvaluateBottomSheetViewControllerDelegate {
    func didTapSaveButton(completion: @escaping () -> Void) {
        self.navigationController?.popToRootViewController(animated: false)
        completion()
    }
    
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        bringRootRecommend.do {
            $0.contentMode = .scaleAspectFill
            $0.image = Image.BringRootRecommend
        }
        
        logoImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
        }
        
        backButton.do {
            $0.setImage(Image.vector, for: .normal)
        }
        
        saveButton.do {
            $0.setImage(Image.save, for: .normal)
        }
        
        bringButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#000000").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            
            // 삼항 연산자를 사용하여 버튼 제목 설정
            let buttonTitle = pushBringButtonFlag ? "" : "선수과목제도 불러오기"
            $0.setTitle(buttonTitle, for: .normal)
            
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
        }
        
        
        importRecommendListView.do {
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.separatorStyle = .none
            $0.register(importRootTableViewCell.self, forCellReuseIdentifier: "Cell")
            $0.showsVerticalScrollIndicator = false
        }
        
        scrollContainer.do {
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(logoImage, recommendView, backButton, saveButton, bringButton, scrollContainer)
        scrollContainer.addSubview(importRecommendListView)
        
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(168)
            $0.height.equalTo(43)
        }
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(690)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        bringButton.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(350)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(50)
        }
        
        importRecommendListView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(300)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(370) // 예: 화면 크기에서 일정 값을 차감한 값으로 설정
        }
        
        scrollContainer.snp.makeConstraints {
             $0.top.equalTo(logoImage.snp.bottom).offset(300)
            $0.bottom.equalTo(saveButton.snp.top).offset(-10)
             $0.centerX.equalToSuperview()
             $0.width.equalTo(400)
         }
        
        
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(pushToRecommendViewController), for: .touchUpInside)
                saveButton.addTarget(self, action: #selector(presnetToCreateRecommendBottomSheetViewController), for: .touchUpInside)
        bringButton.addTarget(self, action: #selector(pressedBringButton), for: .touchUpInside)
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
    
    
    
    func getPreLecture() {
        preLectureAPI.shared.getPreLecture(token: token) { [self] result in
            switch result {
            case .success(let data):
                if let data = data as? PreLectureDTO {
                    pushBringButtonFlag.toggle()
                    if pushBringButtonFlag == true {
                        bringButton.removeFromSuperview()
                        scrollContainer.isHidden = false
//                        for i in data.data {
//                            getpreLectureId.append(i.preLectureID)
//                            print("🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊현재 getpreLectureId : \(getpreLectureId)🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊")
//                        }
                        self.importReviewList = [data] // API 응답을 저장합니다.
                        print("🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊현재 importReviewList\(self.importReviewList)🌊🌊🌊🌊🌊🌊🌊🌊🌊")
                        importRecommendListView.reloadData()
                        
                        scrollContainer.addSubview(importRecommendListView)
                        
                    } else {
                        bringButton.setTitle("선수과목제도 불러오기", for: .normal)
    //                  importRecommendListView.isHidden = true
                        scrollContainer.isHidden = true
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
    
    // MARK: - @objc Methods
    
    @objc
    private func pushToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc private func pressedBringButton() {
        
        print("-------------내가 저장한 루트추천 불러오기 시작-------------")
        getPreLecture()
        
        
    }
    
    @objc
    func presnetToCreateRecommendBottomSheetViewController() {
        
        if (recommendView.titleTextFieldText == nil || recommendView.contentTextFieldText == "본문을 입력해주세요") {
            print("입력을 다 해주세요")
            let customAlertVC = AlertViewOfRecommendController(alertType: .notEnteredCreateRootView)
            customAlertVC.modalPresentationStyle = .overFullScreen
            UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
        } else {
            self.createData.title = recommendView.titleTextFieldText ?? ""
            self.createData.recommendation = recommendView.contentTextFieldText ?? ""
            self.createData.preLectureList = getpreLectureId
            print(self.createData)
            
            print("titleTextField : \(String(describing: recommendView.titleTextFieldText))")
            print("contentTextField : \(recommendView.contentTextFieldText ?? "")")
            
            let bottomSheetVC = CreateRecommendBottomSheetViewController()
            bottomSheetVC.dataBind(data: self.createData)
            bottomSheetVC.delegate = self
            present(bottomSheetVC, animated: true, completion: nil)
        }
    }
    
}


extension CreateRecommendViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard !importReviewList.isEmpty else { return 0 }
        
        let dto = importReviewList[0] // 이 부분을 수정하세요.
        
        // 아래의 i를 indexPath.row로 변경합니다.
        let review = dto.data[indexPath.row]
        
        let lecCount = review.lecNames.count
        
        switch lecCount {
            case 1...2:
                return 170
            case 3:
                return 220
            default:
                return 265
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !importReviewList.isEmpty else {
            return 0 // importReviewList가 비어있으면 0을 반환합니다.
        }
        
        let t = importReviewList[0]
        print("@@@@@@@@@@",t.data.count)
        
        return t.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! importRootTableViewCell
        guard !importReviewList.isEmpty else { return cell }
        let dto = importReviewList[0] // 이 부분을 수정하세요.
        
        cell.importRootModelConfigure(with: dto, at: indexPath)
        
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
}

