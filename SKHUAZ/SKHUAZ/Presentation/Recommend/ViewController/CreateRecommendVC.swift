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
    private let bringRecommendView = UITableView()
    private let bringButton = UIButton()
    
    private let importRecommendListView = UITableView()
    
    private let bringRootRecommend = UIImageView()
    private let imageContainer = UIView()
    
    
    var pushBringButtonFlag: Bool = false
    
    // MARK: - Properties
    
    var importReviewList: [RecommendDataModel] = []
    
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
        
        imageContainer.do {
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(logoImage, recommendView, backButton, saveButton, bringButton, imageContainer)
        
        
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
        
        imageContainer.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(350)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(1700)
        }
        
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(pushToRecommendViewController), for: .touchUpInside)
                saveButton.addTarget(self, action: #selector(presnetToCreateRecommendBottomSheetViewController), for: .touchUpInside)
        bringButton.addTarget(self, action: #selector(pressedBringButton), for: .touchUpInside)
    }
    
    private func setupData() {
        importReviewList = [recommendReview1, recommendReview2, recommendReview3, recommendReview4]
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
    private func pushToRecommendViewController() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc private func pressedBringButton() {
        pushBringButtonFlag.toggle()
        if pushBringButtonFlag == true {
            bringButton.removeFromSuperview()
//            view.addSubview(importRecommendListView)
//
//            importRecommendListView.snp.makeConstraints {
//                $0.top.equalTo(logoImage.snp.bottom).offset(340)
//                $0.bottom.equalTo(saveButton.snp.top).inset(-15)
//                $0.centerX.equalToSuperview()
//                $0.width.equalTo(UIScreen.main.bounds.width)
//            }
            imageContainer.isHidden = false
            imageContainer.addSubview(bringRootRecommend)
            
            
            
            bringRootRecommend.snp.makeConstraints {
                $0.top.equalTo(logoImage.snp.bottom).offset(340)
                $0.bottom.equalTo(saveButton.snp.top).inset(-15)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(393)
                $0.height.equalTo(1611)
            }
        }
        print(pushBringButtonFlag)
    }
    
    @objc
    func presnetToCreateRecommendBottomSheetViewController() {
        
        if (recommendView.titleTextFieldText == nil || recommendView.contentTextFieldText == "본문을 입력해주세요") {
            print("입력을 다 해주세요")
            let customAlertVC = AlertViewOfRecommendController(alertType: .notEnteredCreateRootView)
            customAlertVC.modalPresentationStyle = .overFullScreen
            UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
        } else {
            print("titleTextField : \(String(describing: recommendView.titleTextFieldText))")
            print("contentTextField : \(recommendView.contentTextFieldText ?? "")")
            
            let bottomSheetVC = CreateRecommendBottomSheetViewController()
            bottomSheetVC.delegate = self
            present(bottomSheetVC, animated: true, completion: nil)
        }
    }
    
}


extension CreateRecommendViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return importReviewList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! importRootTableViewCell
        let review = importReviewList[indexPath.row]
        print(review)
        
        cell.importRootModelConfigure(with: review)
        
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
