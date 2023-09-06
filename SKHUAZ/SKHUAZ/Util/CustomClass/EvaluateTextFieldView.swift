//
//  EvaluateTextFieldView.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/06.
//

import UIKit

import Then
import SnapKit

class EvaluateTextFieldView: UIView {
    
    // MARK: - UI Components
    
    private let guideLabel = UILabel()
    private let textField = UITextField()
    
    // MARK: - Properties
    
    private let guideText: String
    
    // MARK: - Initializer
    
    init(guideText: String) {
        self.guideText = guideText
        super.init(frame: .zero)
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - UI Components Property
     
     private func setUI(){
         
         textField.do {
             $0.placeholder = "1~100 사이 입력"
             $0.font = .systemFont(ofSize: 8)
             $0.backgroundColor = UIColor(hex: "#EFEFEF")
             $0.layer.cornerRadius = 6
             let paddingView = UIView(frame:CGRect(x:0, y:0, width:8, height:self.frame.height))
             $0.leftViewMode = .always
             $0.leftView = paddingView
          }

         guideLabel.do {
             $0.text = guideText
             $0.font = .systemFont(ofSize: 8)
             $0.textColor = .black
          }
      }
    
    
      // MARK: - Layout Helper
     
      private func setLayout() {

          addSubviews(guideLabel, textField)
          
          textField.snp.makeConstraints {
              $0.leading.equalTo(guideLabel.snp.trailing).offset(11)
              $0.width.equalTo(228)
              $0.height.equalTo(30)
              $0.centerY.equalTo(self)
          }

          guideLabel.snp.makeConstraints {
              $0.centerY.equalTo(self)
              $0.leading.equalTo(self)
          }
      }

     private func setAddTarget() {
         textField.addTarget(self, action:#selector(textFieldChanged), for:.editingChanged)
     }

     @objc private func textFieldChanged() {
           print("입력한 점수:", self.textField.text ?? "")
     }
}
