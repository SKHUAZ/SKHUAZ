//
//  RadioViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/08.
//
//
//import UIKit
//
//import SnapKit
//import Then
//
//class RadioViewController: UIViewController, RadioButtonsStackDelegate {
//    func radioButtonStack(_ radioButtonStack: RadioButtonsStack, didSelectValue value: String?) {
//        selectedValue = value
//                // 선택된 값에 대한 작업 수행
//                print("Selected Value: \(value ?? "None")")
//    }
//
//    private let graduateRadioButton = RadioButtonsStack()
//    private let text = UILabel()
//
//    var selectedValue: String?
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//        // Add the RadioButtonsStack to the view
//        graduateRadioButton.do {
//            let options = ["미졸업", "졸업"]
//            $0.set(options)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            graduateRadioButton.addTarget(self, action: #selector(radioButtonSelected(_:)), for: .valueChanged)
//                    return graduateRadioButton
//        }
//
//        text.do {
//            $0.text = "Selected Value: \(value ?? "None")"
//        }
//
//        view.addSubview(graduateRadioButton)
//        graduateRadioButton.delegate = self
//
//        // Configure constraints for the RadioButtonsStack
//        graduateRadioButton.snp.makeConstraints {
//            $0.top.bottom.leading.trailing.equalToSuperview().inset(100)
//        }
//        text.snp.makeConstraints {
//            $0.top.equalTo(graduateRadioButton.snp.bottom).offset(100)
//        }
//    }
//}
//
//import UIKit
//
//class RadioViewController: UIViewController {
//
//    let radioButtonsStack: RadioButtonsStack = {
//        let stack = RadioButtonsStack(groupId: <#Int#>)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
//    let resultLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Selected Value: None"
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//
//        // Add the RadioButtonsStack to the view
//        view.addSubview(radioButtonsStack)
//        view.addSubview(resultLabel)
//
//        // Configure constraints for the RadioButtonsStack
//        NSLayoutConstraint.activate([
//            radioButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            radioButtonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            radioButtonsStack.widthAnchor.constraint(equalToConstant: 300), // Adjust the width as needed
//        ])
//
//        // Configure constraints for the resultLabel
//        NSLayoutConstraint.activate([
//            resultLabel.topAnchor.constraint(equalTo: radioButtonsStack.bottomAnchor, constant: 20), // Adjust the spacing as needed
//            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//
//        // Set options for the RadioButtonsStack
//        let options = ["Option 1", "Option 2", "Option 3"]
//        radioButtonsStack.set(options)
//        
//        // Set the delegate for the RadioButtonsStack
//    }
//
//    // Implement the delegate method to update the resultLabel text
//    func radioButtonStack(_ radioButtonStack: RadioButtonsStack, didSelectValue value: String?) {
//        // Handle the selected value here
//        if let selectedValue = value {
//            resultLabel.text = "Selected Value: \(selectedValue)"
//        } else {
//            resultLabel.text = "Selected Value: None"
//        }
//    }
//}
