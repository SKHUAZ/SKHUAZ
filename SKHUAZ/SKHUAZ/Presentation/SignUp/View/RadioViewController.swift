//
//  RadioViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/08.
//

import UIKit

class RadioViewController: UIViewController, RadioButtonsStackDelegate {
    func radioButtonStack(_ radioButtonStack: RadioButtonsStack, didSelectValue value: String?) {
        selectedValue = value
                // 선택된 값에 대한 작업 수행
                print("Selected Value: \(value ?? "None")")
    }
    
    var selectedValue: String?

    let radioButtonsStack: RadioButtonsStack = {
        let stack = RadioButtonsStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Add the RadioButtonsStack to the view
        view.addSubview(radioButtonsStack)
        radioButtonsStack.delegate = self

        // Configure constraints for the RadioButtonsStack
        NSLayoutConstraint.activate([
            radioButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            radioButtonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            radioButtonsStack.widthAnchor.constraint(equalToConstant: 300), // Adjust the width as needed
        ])
        
        // Set options for the RadioButtonsStack
        let options = ["미졸업", "졸업"]
        radioButtonsStack.set(options)
              
    }
}
