//
//  RepetitionCheckView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

import SnapKit
import Then

final class RepetitionCheckView: UIView {
    
        // MARK: - UI Components
    
    let nameTextField = UITextField().then {
            $0.placeholder = "이름을 입력해주세요"
            $0.clearButtonMode = .whileEditing
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.borderWidth = 1
        }
        
          let backButton = UIButton().then {
            $0.setTitle("뒤로가기!", for: .normal)
            $0.backgroundColor = .red
            $0.setTitleColor(.blue, for: .normal)
        }
    
    init(placeholder: String, buttonTilte: String) {
        super.init(frame: .zero)
        nameTextField.placeholder = placeholder
        backButton.setTitle(buttonTilte, for: .normal)
        }
        
            @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("SecondView Error!")
        }
    
        // MARK: - Properties

}
extension RepetitionCheckView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        [nameTextField, backButton]
            .forEach { addSubview($0) }
        
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalTo(backButton.snp.leading).offset(-20)
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.leading.equalTo(nameTextField.snp.trailing).offset(10)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
