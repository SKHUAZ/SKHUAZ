//
//  SignUpViewController.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/01.
//

import UIKit

class SignUpViewController: UIViewController {
//    func sendData(mydata: String, groupId: Int) {
//        if groupId == 1 {
//            firstValue = mydata
//        }
//        else {
//            secondValue = mydata
//        }
//    }
    
    
//    var firstValue: String?
//    var secondValue: String?
    
    private let rootView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = rootView
    }
}
