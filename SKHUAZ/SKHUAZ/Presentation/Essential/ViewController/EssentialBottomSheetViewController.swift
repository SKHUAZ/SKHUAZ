//
//  EssentialBottomSheetViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/14.
//

import UIKit

import SnapKit
import Then

protocol EssentialBottomSheetDelegate: AnyObject {
    func didTapSaveButtons()
}

final class EssentialBottomSheetViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    weak var delegate: CreateEvaluateViewController?
    private let titleText: String = "{글제목}"
    weak var delegates: EssentialBottomSheetDelegate?

    
    
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        addTarget()
    }
}

extension EssentialBottomSheetViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.preferredCornerRadius = 20
            sheetPresentationController.prefersGrabberVisible = true
            sheetPresentationController.detents = [.custom {context in
                return 307
            }]
        }
        
        titleLabel.do {
            $0.text = "선수과목제도 확인하기를\n이대로 저장하시겠습니까?"
            $0.textColor = UIColor(hex: "#000000")
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 15)
            $0.textAlignment = .center
        }
        
        cancelButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(UIColor(hex: "#9AC1D1"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        saveButton.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = UIColor(hex: "#9AC1D1").cgColor
            $0.layer.borderWidth = 1
            $0.backgroundColor = UIColor(hex: "#9AC1D1")
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, cancelButton, saveButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(203)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(75)
            $0.leading.equalToSuperview().offset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(75)
            $0.trailing.equalToSuperview().inset(43)
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
    private func addTarget() {
        cancelButton.addTarget(self, action: #selector(dismissToCreateEvaluateViewController), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveEssentialButton), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc
    private func dismissToCreateEvaluateViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func saveEssentialButton() {
        delegates?.didTapSaveButtons()
        postPreLecture()
    }
}


extension EssentialBottomSheetViewController {
    func postPreLecture(){

        let requestBody = [
            PreLectureRequestBody(semester: "1학년 2학기", lecNames: ["웹개발입문"]),
            PreLectureRequestBody(semester: "2학년 1학기", lecNames: ["Java프로그래밍", "데이터베이스"]),
            PreLectureRequestBody(semester: "2학년 2학기", lecNames: ["운영체제", "컴퓨터구조", "데이터통신"]),
            PreLectureRequestBody(semester: "3학년 1학기", lecNames: ["자료구조", "컴퓨터네트워크", "프론트엔드개발", "Python프로그래밍"]),
            PreLectureRequestBody(semester: "3학년 2학기", lecNames: ["알고리즘","모바일프로그래밍","프론트엔드프레임워크","서버구축및형상관리"]),
            PreLectureRequestBody(semester: "4학년 1학기", lecNames:["졸업지도","소프트웨어캡스톤디자인","시스템분석및설계","고급Java프로그래밍"]),
            PreLectureRequestBody(semester:"4학년 2학기" ,lecNames:["빅데이터"])
        ]


        
        
        preLectureAPI.shared.postPreLecture(token: UserDefaults.standard.string(forKey: "AuthToken") ?? "", requestBody: requestBody) { result in
            switch result {
            case .success(let data):
                print(data)
                print("성공")
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
