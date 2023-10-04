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
    private let backButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    var evaluationId: Int = 0
    
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
        
        backButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("수정", for: .normal)
            $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#FFFFFF").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.setTitle("삭제", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(detailEvaluateView, backButton, saveButton)
        
        detailEvaluateView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.height.equalTo(640)
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
    }
    
    private func setNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#9AC1D1")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9AC1D1")]
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        backButton.addTarget(self, action: #selector(popToEvaluateViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(deleteEvaluate), for: .touchUpInside)
    }

    
    // MARK: - @objc Methods
    
    @objc
    private func popToEvaluateViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func deleteEvaluate() {
        delEvaluate(evaluateId: evaluationId)
        self.navigationController?.popViewController(animated: true)
    }
}


extension DetailEvaluateViewController {

    private func loadDetailEvaluate() {
        
        EvaluateAPI.shared.getDetailEvaluation(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", evaluationId: evaluationId) { result in
                 switch result {
                 case .success(let detailEvaluateDTO):
                     if let detailEvaluateDTO = detailEvaluateDTO as? DetailEvaluateDTO {
                         print(detailEvaluateDTO.data.review ?? "No Review")
                         DispatchQueue.main.async {
                                   self.detailEvaluateView.setDetailEvaluateView(
                                       semester: detailEvaluateDTO.data.lecture.semester ?? "No Review",
                                       professor: detailEvaluateDTO.data.lecture.profName ?? "No Review",
                                       lecture: detailEvaluateDTO.data.lecture.lecName ?? "No Review",
                                       title: detailEvaluateDTO.data.title ?? "No Review",
                                       evaluate: detailEvaluateDTO.data.review ?? "No Review",
                                       firstPoint:  detailEvaluateDTO.data.task ?? 0,
                                       secondPoint: detailEvaluateDTO.data.practice ?? 0,
                                       thirdPoint: detailEvaluateDTO.data.presentation ?? 0,
                                       fourtPoint: detailEvaluateDTO.data.teamPlay ?? 0
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
