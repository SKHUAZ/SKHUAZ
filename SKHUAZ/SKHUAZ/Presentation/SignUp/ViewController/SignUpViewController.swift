//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

class SignUpViewController: UIViewController, SendStringData {
    func sendData(mydata: String, groupId: Int) {
        if groupId == 1 {
            firstValue = mydata
        }
        else {
            secondValue = mydata
        }
    }
    
    
    func sendData(mydata data: String) {
            print("Received data: \(data)")
        }
    var firstValue: String?
    var secondValue: String?
    
    private let rootView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = rootView
    }
}
