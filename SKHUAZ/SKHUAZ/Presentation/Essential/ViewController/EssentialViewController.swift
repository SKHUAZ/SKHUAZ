//
//  EssentialViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/23/23.
//

import UIKit

import SnapKit
import Then

enum EssentialType {
    case user
    case admin
}

final class EssentialViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topButton = UIButton()
    private let titleLabel = UILabel()
    private let viewContainer = UIView()
    private let topSection = UIView()
    private let topSectionLabel = UILabel()
    private let tableView = UITableView(frame:.zero, style:.plain)
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let saveButton = UIButton()
    private let addButton = UIButton()
    
    // MARK: - Properties
    
    private let essentialType: EssentialType
    private let semesterLabel: String = ""
    private var postAddAdminData = AddAdminPreLectureRequestBody()
    private var postUserSelectLecData = SelectLecRequestBody(semester: "1학년 2학기")
    private var data: [adminPreLecture] = []
    private var userData: [selectLecData] = []
    private var userCheckYN = UserCheckYnRequestBody(subjectIDS: [])
    private var selectedCellIndexPath: IndexPath?
    private var shouldChangeBackgroundColor: Bool = false
    private let semesterArray: [String] = ["1학년 2학기", "2학년 1학기", "2학년 2학기", "3학년 1학기", "3학년 2학기", "4학년 1학기", "4학년 2학기"]
    private var selectedSemesterIndex: Int = 0
    var selectedSubjectIDs: [Int] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (UserDefaults.standard.string(forKey: "LoginEmail") == "admin") {
            getAdminPreLecture()
        } else {
            postUserSelectLecData.semester = semesterArray[selectedSemesterIndex]
            postSelctLec(requestBody: postUserSelectLecData)
        }
        loadViewData()
        setUI()
        setLayout()
        addTarget()
    }
    
    // MARK: - Initializer
    
    init(essentialType: EssentialType) {
        self.essentialType = essentialType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EssentialViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        switch essentialType {
        case .user:
            topButton.do {
                $0.setImage(Image.questionmark, for: .normal)
                $0.addTarget(self, action: #selector(openTurotial), for: .touchUpInside)
            }
            
            titleLabel.do {
                $0.text = "선수과목제도 확인"
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 20)
            }
            
            viewContainer.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            }
            
            topSection.do {
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
            
            topSectionLabel.do {
                $0.text = "임의로 넣은 텍스트입니다"
                $0.textColor = UIColor(hex: "#FFFFFF")
                $0.font = .systemFont(ofSize: 13)
                $0.textAlignment = .center
            }
            
            tableView.do {
                $0.dataSource = self
                $0.delegate = self
                $0.register(EssentialTableViewCell.self, forCellReuseIdentifier: "Cell")
                $0.allowsMultipleSelection = true
                $0.separatorStyle = .none
                $0.showsVerticalScrollIndicator = false
            }
            
            leftButton.do {
                $0.setImage(Image.leftButton, for: .normal)
            }
            
            saveButton.do {
                $0.setImage(Image.save, for: .normal)
                $0.addTarget(self, action: #selector(presentToEssentialBottomSheetView), for: .touchUpInside)
            }
            
            rightButton.do {
                $0.setImage(Image.rightButton, for: .normal)
            }
        case .admin:
            
            titleLabel.do {
                $0.text = "선수과목 개설 현황"
                $0.textColor = UIColor(hex: "#000000")
                $0.font = .systemFont(ofSize: 20)
            }
            
            viewContainer.do {
                $0.layer.cornerRadius = 6
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
            }
            
            topSection.do {
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
            
            topSectionLabel.do {
                $0.text = "임의로 넣은 텍스트입니다"
                $0.textColor = UIColor(hex: "#FFFFFF")
                $0.font = .systemFont(ofSize: 13)
                $0.textAlignment = .center
            }
            
            tableView.do {
                $0.dataSource = self
                $0.delegate = self
                $0.register(EssentialTableViewCell.self, forCellReuseIdentifier: "Cell")
                $0.separatorStyle = .none
                $0.showsVerticalScrollIndicator = false
                $0.allowsSelection = false
                
            }
            
            saveButton.do {
                $0.setTitle("+", for: .normal)
                $0.backgroundColor = UIColor(hex: "#9AC1D1")
                $0.layer.cornerRadius = 6
                $0.titleLabel?.font = .systemFont(ofSize: 20)
                $0.addTarget(self, action: #selector(presentAlertView), for: .touchUpInside)
                
                
            }
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        switch essentialType {
            
        case .user:
            view.addSubviews(topButton, titleLabel, viewContainer, leftButton, saveButton, rightButton)
            viewContainer.addSubviews(topSection, tableView)
            topSection.addSubviews(topSectionLabel)
            
            topSectionLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            
            topSection.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(37)
            }
            
            tableView.snp.makeConstraints {
                $0.top.equalTo(topSection.snp.bottom).offset(10)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            
            leftButton.snp.makeConstraints {
                $0.top.equalTo(viewContainer.snp.bottom).offset(9)
                $0.trailing.equalTo(saveButton.snp.leading).offset(-30)
                $0.width.height.equalTo(39)
            }
            
            saveButton.snp.makeConstraints {
                $0.top.equalTo(viewContainer.snp.bottom).offset(9)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(83)
                $0.height.equalTo(39)
            }
            
            rightButton.snp.makeConstraints {
                $0.top.equalTo(viewContainer.snp.bottom).offset(9)
                $0.leading.equalTo(saveButton.snp.trailing).offset(30)
                $0.width.height.equalTo(39)
            }
            
            viewContainer.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview().inset(15)
                $0.height.equalTo(590)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.centerX.equalToSuperview()
            }
            
            topButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.trailing.equalToSuperview().inset(22)
                $0.width.height.equalTo(23)
            }
            
        case .admin:
            
            view.addSubviews(topButton, titleLabel, viewContainer, leftButton, saveButton, rightButton)
            viewContainer.addSubviews(topSection, tableView)
            topSection.addSubviews(topSectionLabel)
            
            topSectionLabel.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            
            topSection.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(37)
            }
            
            tableView.snp.makeConstraints {
                $0.top.equalTo(topSection.snp.bottom).offset(10)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            
            
            saveButton.snp.makeConstraints {
                $0.top.equalTo(viewContainer.snp.bottom).offset(9)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(83)
                $0.height.equalTo(39)
            }
            
            
            viewContainer.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(15)
                $0.leading.trailing.equalToSuperview().inset(15)
                $0.height.equalTo(590)
            }
            
            titleLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(60)
                $0.centerX.equalToSuperview()
            }
            
        }
    }
    
    // MARK: - Method
    
    func didTapSaveButtons(withData data: [adminPreLecture]) {
        dismiss(animated: true) { [weak self] in
            let saveEssentialVC = SaveEssentialViewController()
            self?.navigationController?.pushViewController(saveEssentialVC, animated: false)
        }
    }
    
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(saveButton.snp.top)
            $0.width.equalTo(300)
            $0.height.equalTo(35)
        }
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options:.curveEaseOut , animations:{
            toastLabel.alpha=0.0
        }, completion:{(isCompleted) in
            if isCompleted {
                toastLabel.removeFromSuperview()
            }
        })
    }
    
    func loadViewData() {
        switch essentialType {
        case .user:
            postUserSelectLecData.semester = semesterArray[selectedSemesterIndex]
            postSelctLec(requestBody: postUserSelectLecData)
        case .admin:
            getAdminPreLecture()
        }
    }
    
    func addTarget() {
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
    
    func postEnd() {
        if selectedSemesterIndex < semesterArray.count - 1 {
            selectedSemesterIndex += 1
            loadViewData()
        }
    }
    
    @objc func leftButtonTapped() {
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            for indexPath in selectedIndexPaths {
                tableView.deselectRow(at: indexPath, animated: false)
                if let cell = tableView.cellForRow(at: indexPath) as? EssentialTableViewCell {
                    cell.updateUI(isSelected: false)
                }
            }
        }
        if selectedSemesterIndex > 0 {
            selectedSemesterIndex -= 1
            loadViewData()
        }
    }

    @objc func rightButtonTapped() {
        
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            for indexPath in selectedIndexPaths {
                tableView.deselectRow(at: indexPath, animated: false)
                if let cell = tableView.cellForRow(at: indexPath) as? EssentialTableViewCell {
                    cell.updateUI(isSelected: false)
                }
            }
        }
        if selectedSubjectIDs.isEmpty {
            print("배열이 비었습니다")
            postEnd()
        } else {
            userCheckYN = UserCheckYnRequestBody(subjectIDS: selectedSubjectIDs)
            postUserCheckYN(requestBody: userCheckYN)
        }
    }
    
    
    @objc func openTurotial() {
        let customAlertVC = TutorialEssentialViewController()
        customAlertVC.modalPresentationStyle = .overFullScreen
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first,
           let rootViewController = keyWindow.rootViewController {
            rootViewController.present(customAlertVC, animated: false, completion: nil)
        }
    }
    
    @objc
    func presentToEssentialBottomSheetView(){
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            for indexPath in selectedIndexPaths {
                tableView.deselectRow(at: indexPath, animated: false)
                if let cell = tableView.cellForRow(at: indexPath) as? EssentialTableViewCell {
                    cell.updateUI(isSelected: false)
                }
            }
        }
        let bottomSheetVC = EssentialBottomSheetViewController()
        bottomSheetVC.delegates = self // 델리게이트 설정
        self.present(bottomSheetVC, animated: true)
        bottomSheetVC.dataToSave = data // 데이터를 전달
    }
}


extension EssentialViewController : AlertViewDelegate{
    
    @objc func presentAlertView() {
        let customAlertVC = AlertViewController(alertType:.admin)
        customAlertVC.modalPresentationStyle = .overFullScreen
        customAlertVC.delegate = self
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first,
           let rootViewController = keyWindow.rootViewController {
            rootViewController.present(customAlertVC, animated: false, completion: nil)
        }
    }
    
    func didConfirmAction(lectureName: String, professorName: String, semester: String, essentialName: String) {
        print("lectureName: \(lectureName)")
        print("professorName: \(professorName)")
        print("semester: \(semester)")
        print("essentialName: \(essentialName)")
        self.postAddAdminData.preLecName = lectureName
        self.postAddAdminData.preLecSemester = professorName
        self.postAddAdminData.subjectName = semester
        self.postAddAdminData.semester = essentialName
        postAddAdminPreLecture(requestBody: postAddAdminData)
        showToast(message:"선수과목이 성공적으로 추가되었습니다")
        getAdminPreLecture()
    }
}


// MARK: - UITableViewDataSource

extension EssentialViewController: UITableViewDataSource, UITableViewDelegate, EssentialBottomSheetDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (UserDefaults.standard.string(forKey: "LoginEmail") == "admin"){
            return data.count
            
        }
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EssentialTableViewCell
        
        if (UserDefaults.standard.string(forKey: "LoginEmail") == "admin"){
            let item = data[indexPath.row]
            cell.configure(with: item)
            return cell
        }
        
        let item = userData[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndexPath = indexPath
        shouldChangeBackgroundColor = true
        if (UserDefaults.standard.string(forKey: "LoginEmail") == "admin"){
            let cellID = data[indexPath.row]
            print("Selected Cell ID:", cellID)
        }
        let cellID = userData[indexPath.row]
        print("Selected Cell SubjectID:", cellID.subjectID)
        getUserCheckLec(path: cellID.subjectID)
        
        if !selectedSubjectIDs.contains(cellID.subjectID) {
            selectedSubjectIDs.append(cellID.subjectID)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? EssentialTableViewCell {
            var cellID = userData[indexPath.row]
            cellID.clickYn = false
            print(cellID)
            cell.isSelected = false
            cell.updateUI(isSelected: false)
            
            if let index = selectedSubjectIDs.firstIndex(of: cellID.subjectID) {
                selectedSubjectIDs.remove(at: index)
            }
        }
    }
}


extension EssentialViewController {
    
    // MARK: - User API
    
    // 1. User 학기별 선수과목 리스트 조회
    
    func postSelctLec(requestBody: SelectLecRequestBody) {
        UserPreLectureAPI.shared.postUserSelectLec(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", requestBody: requestBody) { result in
            
            switch result {
            case .success(let data):
                if let data = data as? SelectLecDTO {
                    let serverData = data.data
                    self.userData = serverData
                    self.tableView.reloadData()
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
    
    // 2. User 선수과목 선택 가능 여부
    
    private func getUserCheckLec(path: Int) {
        UserPreLectureAPI.shared.getUserCheckLec(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", path: path) { result in
            switch result {
            case .success(let data):
                if let data = data as? CheckLecDTO {
                    if data.statusCode == 200 {
                        _ = data.data
                        if let indexPath = self.selectedCellIndexPath, self.shouldChangeBackgroundColor {
                            let cell = self.tableView.cellForRow(at: indexPath) as? EssentialTableViewCell
                            cell?.updateUI(isSelected: true)
                            if let userCell = cell, let userIndexPath = self.tableView.indexPath(for: userCell) {
                                var userItem = self.userData[userIndexPath.row]
                                userItem.clickYn = true
                            }
                        }
                        self.selectedCellIndexPath = nil
                        self.shouldChangeBackgroundColor = false
                    }
                    if data.statusCode == 202 {
                        
                        let customAlertVC = AlertViewController(alertType:.softwareCheck)
                        customAlertVC.setSoftwareCheckMessage(data.message)
                        customAlertVC.modalPresentationStyle = .overFullScreen
                        customAlertVC.delegate = self
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let keyWindow = windowScene.windows.first,
                           let rootViewController = keyWindow.rootViewController {
                            rootViewController.present(customAlertVC, animated: false, completion: nil)
                        }
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
    
    // 3. 선수과목 checkYN 변경 API
    
    func postUserCheckYN(requestBody: UserCheckYnRequestBody) {
        UserPreLectureAPI.shared.postUserCheckYN(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", requestBody: requestBody) { result in
            switch result {
            case .success(_):
                self.selectedSubjectIDs.removeAll()
                self.postEnd()
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
    
    
    
    // MARK: - Admin API
    
    // 1. Admin 선수과목 리스트 조회
    
    func getAdminPreLecture() {
        AdminPreLectureAPI.shared.getAdminPreLecture(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "") { result in
            switch result {
            case .success(let data):
                if let data = data as? AdminPreLectureDTO {
                    let serverData = data.data
                    self.data = serverData
                    // 테이블 뷰 리로드
                    self.tableView.reloadData()

                    print("====================================")
                    print(serverData)
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
    // 2. Admin 선수과목 추가하기 POST
    
    func postAddAdminPreLecture(requestBody: AddAdminPreLectureRequestBody) {
        AdminPreLectureAPI.shared.postAddAdminPreLecture(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", requestBody: requestBody) { result in
            switch result {
            case .success(let data):
                print(data)
                print("성공")
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

