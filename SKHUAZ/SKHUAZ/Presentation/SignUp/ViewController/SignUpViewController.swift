//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

class SignUpViewController: UIViewController, DataTransferDelegate  {
    
    func sendData(_ data: String) {
            print("Received data: \(data)")
        }
    
    private let rootView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let senderVC = RadioButtonsStack()
        senderVC.delegate = self
    }
    
    override func loadView() {
        self.view = rootView
    }
}
