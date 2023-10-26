//
//  DetailEvaluateViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/08.
//

import UIKit

import SnapKit
import Then

class DetailEvaluateViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let mainImage = UIImageView()
    private let detailEvaluateView = EvaluateView(frame: .zero, evaluateType: .detailEvalute)
    private let editButton = UIButton()
    private let deleteButton = UIButton()
    private let modifyButton = UIButton()
    
    // MARK: - Properties
    
    var evaluationId: Int = 0
    private var writerEmail: String = ""
    private var loginUserEmail = UserDefaults.standard.string(forKey: "Nickname")
    private var putData = EditEvaluateRequestBody()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        self.hideKeyboardWhenTappedAround()
        addTarget()
        setNavigationBar()
        loadDetailEvaluate()
        print(evaluationId)
        print("================")
    }
}

extension DetailEvaluateViewController {
    
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        mainImage.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.Logo1
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
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(detailEvaluateView, editButton, deleteButton, modifyButton)
        
        detailEvaluateView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.height.equalTo(700)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        editButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(39)
        }
        
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
        editButton.addTarget(self, action: #selector(editEvaluate), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteEvaluate), for: .touchUpInside)
        modifyButton.addTarget(self, action: #selector(modify), for: .touchUpInside)
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
    
    
    // MARK: - @objc Methods
    
    @objc
    private func modify() {
        editDataBind()
        putEvaluate(putEvaluate: putData)
    }
    
    @objc
    private func deleteReview() {
        delEvaluate(evaluateId: evaluationId)
        dismiss(animated: false, completion: nil)
    }
    
    @objc
    private func editEvaluate() {
        
        if loginUserEmail == writerEmail || UserDefaults.standard.string(forKey: "Nickname") == "admin" {
            print("작성자가와 로그인 한 사람이 같습니다")
            detailEvaluateView.setEditable(true)
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
    private func deleteEvaluate() {
        if loginUserEmail == writerEmail || UserDefaults.standard.string(forKey: "Nickname") == "admin" {
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
}


extension DetailEvaluateViewController {
    
    private func loadDetailEvaluate() {
        
        EvaluateAPI.shared.getDetailEvaluation(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", evaluationId: evaluationId) { result in
            switch result {
            case .success(let detailEvaluateDTO):
                if let detailEvaluateDTO = detailEvaluateDTO as? DetailEvaluateDTO {
                    print(detailEvaluateDTO.data.review)
                    self.writerEmail = detailEvaluateDTO.data.nickname
                    DispatchQueue.main.async {
                        self.detailEvaluateView.setDetailEvaluateView(
                            semester: detailEvaluateDTO.data.lecture.semester,
                            professor: detailEvaluateDTO.data.lecture.profName,
                            lecture: detailEvaluateDTO.data.lecture.lecName,
                            title: detailEvaluateDTO.data.title,
                            evaluate: detailEvaluateDTO.data.review,
                            firstPoint:  detailEvaluateDTO.data.task,
                            secondPoint: detailEvaluateDTO.data.practice,
                            thirdPoint: detailEvaluateDTO.data.presentation,
                            fourtPoint: detailEvaluateDTO.data.teamPlay
                        )
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
    
    private func delEvaluate(evaluateId: Int) {
        EvaluateAPI.shared.delEvaluate(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", evaluationId: evaluateId) { result in
            switch result {
            case .success(let data):
                if let response = data as? DelEvaluateDTO {
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
    
    private func putEvaluate(putEvaluate: EditEvaluateRequestBody) {
//        DispatchQueue.main.async { [weak self] in
//            self?.navigationController?.popViewController(animated: true)
//        }
        self.deleteButtonUnEnabled()

        EvaluateAPI.shared.editEvaluate(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", evaluationId: evaluationId, requestBody: putEvaluate) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
                self.deleteButtonUnEnabled()

                if let response = data as? EditEvaluateDTO {
                    print("Deleted successfully with message: \(response.message)")
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
    
    private func editDataBind() {
        self.putData.deptName = "IT"
        self.putData.lecName = detailEvaluateView.lectureButtonTitle ?? ""
        self.putData.profName = detailEvaluateView.propeserButtonTitle ?? ""
        self.putData.semester = detailEvaluateView.semesterButtonTitle ?? ""
        self.putData.teamPlay = detailEvaluateView.fourthSliderValue
        self.putData.task = detailEvaluateView.firstSliderValue
        self.putData.practice = detailEvaluateView.secondSliderValue
        self.putData.presentation = detailEvaluateView.thirdSliderValue
        self.putData.title = detailEvaluateView.titleTextFieldText ?? ""
        self.putData.review = detailEvaluateView.evaluateViewText ?? ""
    }
}
