//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

final class SignUpViewController: UIViewController, SignUpViewDelegate {
    func nicknameCheckButtonTapped() {
        let bottomSheetVC = CreateEmailAuthViewController()
//                bottomSheetVC.delegate = self
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
    func emailCheckButtonTapped() {
//                let customAlertVC = AlertViewController(alertType: .createEvaluate)
//                customAlertVC.modalPresentationStyle = .overFullScreen
//                UIApplication.shared.windows.first?.rootViewController?.present(customAlertVC, animated: false, completion: nil)
//            } else {
//                print("Semester Button Title : \(evaluateView.semesterButtonTitle ?? "")")
//                print("Propeser Button Title : \(evaluateView.propeserButtonTitle ?? "")")
//                print("Lecture Button Title : \(evaluateView.lectureButtonTitle ?? "")")
//                print("Title Text Field Text : \(evaluateView.titleTextFieldText ?? "")")
//                print("Evaluate View Text : \(evaluateView.evaluateViewText ?? "")")
//
//                print("First Slider Value : \(evaluateView.firstSliderValue)")
//                print("Second Slider Value : \(evaluateView.secondSliderValue)")
//                print("Third Slider Value : \(evaluateView.thirdSliderValue)")
//                print("Fourth Slider Value : \(evaluateView.fourthSliderValue)")
                let bottomSheetVC = CreateEmailAuthViewController()
//                bottomSheetVC.delegate = self
                present(bottomSheetVC, animated: true, completion: nil)
            }
//        }
//    }
    
    func signUpButtonTapped() {
        let bottomSheetVC = CreateEmailAuthViewController()
//                bottomSheetVC.delegate = self
        present(bottomSheetVC, animated: true, completion: nil)
    }
    

    // MARK: - UI Components
    
    private let rootView = SignUpView()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupKeyboardEvent()
    }
    
    override func loadView() {
        self.view = rootView
        rootView.delegate = self
    }
    
    // MARK: - Methods
    
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
